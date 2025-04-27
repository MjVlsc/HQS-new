<?php
session_start();
require('lib/conn.php');
require('lib/audit.php');

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Determine redirect URL based on user role
$redirect_url = ($_SESSION['role'] == 'Admin') ? 'mainpage.php' : 'queue_display.php';

// Handle reprint request
if (isset($_GET['reprint']) && !empty($_GET['reprint'])) {
    $queueId = $_GET['reprint'];

    // Fetch the queue data from database
    $stmt = $conn->prepare("SELECT 
        q.queue_num, 
        q.service_name, 
        q.priority, 
        q.created_at,
        d.name as department_name
        FROM queues q
        JOIN departments d ON q.department_id = d.dept_id
        WHERE q.qid = :queue_id AND q.created_by = :user_id");

    $stmt->execute([
        ':queue_id' => $queueId,
        ':user_id' => $_SESSION['user_id']
    ]);

    $queueData = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($queueData) {
        // Store in session for display
        $_SESSION['ticket_data'] = [
            'queue_num' => $queueData['queue_num'],
            'services' => $queueData['service_name'],
            'department' => $queueData['department_name'],
            'priority' => $queueData['priority'],
            'created_at' => $queueData['created_at']
        ];

        // Log the reprint action
        logAction(
            $conn,
            'REPRINT_TICKET',
            'queues',
            $queueId,
            $_SESSION['user_id'],
            $_SESSION['username'],
            $_SESSION['role'],
            json_encode(['queue_num' => $queueData['queue_num']])
        );
    } else {
        // Queue not found or doesn't belong to user
        $_SESSION['error'] = "Ticket not found or you don't have permission to reprint it";
        header("Location: $redirect_url");
        exit();
    }
}

// Check if ticket data exists
if (!isset($_SESSION['ticket_data'])) {
    header("Location: $redirect_url");
    exit();
}

$ticket = $_SESSION['ticket_data'];
unset($_SESSION['ticket_data']); // Clear after use
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=80mm, initial-scale=1.0">
  <title>Queue Ticket</title>
  <style>
    @page {
      size: 80mm 100mm;
      margin: 0;
    }
    body {
      font-family: Arial, sans-serif;
      font-size: 10px;
      margin: 0;
      padding: 20px 0;
      background: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .ticket {
      border: 1px solid #000;
      width: 76mm;
      padding: 10px;
      box-sizing: border-box;
      background: #fff;
    }
    .ticket-columns {
      display: flex;
      justify-content: space-between;
      margin-top: 10px;
    }
    .column {
      width: 48%;
    }
    .ticket-detail {
      margin-bottom: 8px;
    }
    .detail-label {
      font-weight: bold;
      font-size: 0.9em;
    }
    .ticket-header {
      text-align: center;
      margin-bottom: 15px;
    }
    .ticket-number {
      font-size: 2em;
      text-align: center;
      font-weight: bold;
      margin: 15px 0;
    }
    .no-print {
      margin-top: 20px;
      text-align: center;
    }
    .action-buttons {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 10px;
    }
    .action-btn {
      padding: 12px 20px;
      font-size: 14px;
      cursor: pointer;
      border: none;
      border-radius: 5px;
      font-weight: bold;
    }
    .print-btn {
      background: #4CAF50;
      color: white;
    }
    .back-btn {
      background: #f44336;
      color: white;
    }
    @media print {
      body {
        padding-top: 10mm; /* little gap from top */
        align-items: center; /* center horizontally */
        justify-content: flex-start; /* top vertically */
      }
      .no-print {
        display: none !important;
      }
      .ticket {
        margin: 0 auto;
      }
    }
  </style>
</head>
<body>

<div class="ticket">
  <div class="ticket-header">
      <h2>HOSPITAL QUEUE SYSTEM</h2>
      <p>QUEUE TICKET</p>
  </div>

  <div class="ticket-number">
      <?= htmlspecialchars($ticket['queue_num']) ?>
  </div>

  <div class="ticket-columns">
      <div class="column">
          <div class="ticket-detail">
              <div class="detail-label">DEPARTMENT</div>
              <div><?= htmlspecialchars($ticket['department']) ?></div>
          </div>
          <div class="ticket-detail">
              <div class="detail-label">PRIORITY</div>
              <div><?= htmlspecialchars(ucwords(str_replace('_', ' ', $ticket['priority']))) ?></div>
          </div>
      </div>

      <div class="column">
          <div class="ticket-detail">
              <div class="detail-label">SERVICES</div>
              <div><?= htmlspecialchars($ticket['services']) ?></div>
          </div>
          <div class="ticket-detail">
              <div class="detail-label">DATE & TIME</div>
              <?php
                  date_default_timezone_set('Asia/Manila');
                  echo date('M j, Y g:i A');
              ?>
          </div>
      </div>
  </div>
</div>

<div class="no-print">
    <div class="action-buttons">
        <button onclick="window.location.href='add_patient_q.php'" class="action-btn back-btn">
            ← Back
        </button>
        <button onclick="printTicket()" class="action-btn print-btn">
            🖨️ Print
        </button>
    </div>
</div>

<script>
    function printTicket() {
        window.print();
        checkPrintStatus();
    }
    window.onafterprint = function() {
        window.location.href = "add_patient_q.php";
    };
    function checkPrintStatus() {
        setTimeout(function() {
            window.location.href = "<?= $redirect_url ?>";
        }, 3000);
    }
</script>
</body>
</html>
