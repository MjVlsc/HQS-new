<?php 
require('lib/conn.php');

// Get department_id from URL or default to 8
$departmentId = isset($_GET['department_id']) ? intval($_GET['department_id']) : 8;

// Fetch department name
$deptName = "Unknown Department";
$deptStmt = $conn->prepare("SELECT name FROM departments WHERE dept_id = :dept_id");
$deptStmt->execute(['dept_id' => $departmentId]);
if ($row = $deptStmt->fetch()) {
    $deptName = $row['name'];
}

// Get current queue with exact priority ordering
$currentStmt = $conn->prepare("
    SELECT * FROM queues 
    WHERE status = 'in-progress' AND department_id = :dept_id
    ORDER BY 
        CASE 
            WHEN priority = 'Red Flag' THEN 0
            WHEN priority = 'Emergency' THEN 1
            WHEN priority IN ('PWD', 'Senior Citizen', 'Pregnant') THEN 2
            ELSE 3
        END,
        CAST(SUBSTRING(queue_num, 3) AS UNSIGNED) ASC
    LIMIT 1
");
$currentStmt->execute(['dept_id' => $departmentId]);
$currentQueue = $currentStmt->fetch();

// Get upcoming queues (same ordering)
$upcomingStmt = $conn->prepare("
    SELECT * FROM queues 
    WHERE status = 'waiting' AND department_id = :dept_id
    ORDER BY 
        CASE 
            WHEN priority = 'Red Flag' THEN 0
            WHEN priority = 'Emergency' THEN 1
            WHEN priority IN ('PWD', 'Senior Citizen', 'Pregnant') THEN 2
            ELSE 3
        END,
        CAST(SUBSTRING(queue_num, 3) AS UNSIGNED) ASC
    LIMIT 10
");
$upcomingStmt->execute(['dept_id' => $departmentId]);
$upcomingQueues = $upcomingStmt->fetchAll();

// Get pending queues (last 5)
$pendingStmt = $conn->prepare("
    SELECT * FROM queues 
    WHERE status = 'pending' AND department_id = :dept_id
    ORDER BY updated_at DESC
    LIMIT 5
");
$pendingStmt->execute(['dept_id' => $departmentId]);
$pendingQueues = $pendingStmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Queue Display - <?= htmlspecialchars($deptName) ?></title>
  <style>
    :root {
      --primary: #333;
      --secondary: #e63946;
      --warning: #FF9800;
      --light-gray: #f5f5f5;
      --white: #ffffff;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: var(--white);
      color: var(--primary);
      height: 100vh;
      display: grid;
      grid-template-columns: 1fr 2fr 1fr;
      gap: 20px;
      padding: 20px;
      overflow: hidden;
    }

    .panel {
      display: flex;
      flex-direction: column;
      height: 100%;
      background: var(--light-gray);
      border-radius: 10px;
      padding: 20px;
      overflow-y: auto;
    }

    .department-name {
      font-size: 3rem;
      font-weight: bold;
      text-transform: uppercase;
      margin-bottom: 1rem;
      text-align: center;
    }

    .section-title {
      font-size: 1.8rem;
      margin-bottom: 1rem;
      text-align: center;
      padding-bottom: 0.5rem;
      border-bottom: 2px solid var(--primary);
    }

    .current-queue {
      margin: 2rem 0;
      text-align: center;
    }

    .current-number {
      font-size: 8rem;
      font-weight: bold;
      color: var(--secondary);
      line-height: 1;
      margin: 1rem 0;
      text-align: center;
    }

    .priority-badge {
      font-size: 1.5rem;
      padding: 0.4rem 1rem;
      border-radius: 20px;
      margin-top: 1rem;
      display: inline-block;
      color: var(--white);
    }

    .priority-red-flag {
      background-color: #d9534f;
    }

    .priority-emergency {
      background-color: #f0ad4e;
    }

    .priority-pwd, .priority-senior-citizen, .priority-pregnant {
      background-color: #5bc0de;
    }

    .priority-normal {
      background-color: #5bc0de;
    }

    .queue-list {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    .queue-item {
      font-size: 1.6rem;
      padding: 1rem;
      background: var(--white);
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
    }

    .queue-item:hover {
      transform: scale(1.05);
    }

    .queue-item.pending {
      background-color: #fff3cd;
    }

    .empty-state {
      font-size: 1.3rem;
      opacity: 0.6;
      text-align: center;
      padding: 1rem;
    }

    @media (max-width: 1200px) {
      body {
        grid-template-columns: 1fr 1fr;
        grid-template-rows: auto 1fr;
      }
    }

    @media (max-width: 768px) {
      body {
        grid-template-columns: 1fr;
        grid-template-rows: auto auto auto;
      }
      .current-number {
        font-size: 5rem;
      }
    }
  </style>
</head>
<body>

<!-- Left Panel (Upcoming) -->
<div class="panel">
  <div class="section-title">Upcoming</div>
  <div class="queue-list">
    <?php if (count($upcomingQueues) > 0): ?>
      <?php foreach ($upcomingQueues as $q): ?>
        <div class="queue-item">
          <?= htmlspecialchars($q['queue_num']) ?>
          <?php if ($q['priority']): ?>
            <small>(<?= htmlspecialchars($q['priority']) ?>)</small>
          <?php endif; ?>
        </div>
      <?php endforeach; ?>
    <?php else: ?>
      <div class="empty-state">No upcoming queues</div>
    <?php endif; ?>
  </div>
</div>

<!-- Center Panel (Now Serving) -->
<div class="panel">
  <div class="department-name"><?= htmlspecialchars($deptName) ?></div>
  <div class="current-queue">
    <div class="current-label">Now Serving</div>
    <?php if ($currentQueue): ?>
      <div class="current-number"><?= htmlspecialchars($currentQueue['queue_num']) ?></div>
      <?php if ($currentQueue['priority']): ?>
        <div class="priority-badge priority-<?= strtolower(str_replace(' ', '-', $currentQueue['priority'])) ?>">
          <?= htmlspecialchars($currentQueue['priority']) ?>
        </div>
      <?php endif; ?>
    <?php else: ?>
      <div class="current-number empty-state">---</div>
    <?php endif; ?>
  </div>
</div>

<!-- Right Panel (Pending) -->
<div class="panel">
  <div class="section-title">Pending</div>
  <div class="queue-list">
    <?php if (count($pendingQueues) > 0): ?>
      <?php foreach ($pendingQueues as $q): ?>
        <div class="queue-item pending">
          <?= htmlspecialchars($q['queue_num']) ?>
          <?php if ($q['priority']): ?>
            <small>(<?= htmlspecialchars($q['priority']) ?>)</small>
          <?php endif; ?>
        </div>
      <?php endforeach; ?>
    <?php else: ?>
      <div class="empty-state">No pending queues</div>
    <?php endif; ?>
  </div>
</div>

<script>
  // Auto-refresh every 5 seconds
  setTimeout(() => location.reload(), 5000);
</script>

</body>
</html>
