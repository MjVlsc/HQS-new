<?php
session_start();
date_default_timezone_set('Asia/Manila');

require('lib/conn.php');


if (!isset($_SESSION['ticket_data'])) {
    header("Location: add_patient_q.php");
    exit();
}

$ticket = $_SESSION['ticket_data'];
unset($_SESSION['ticket_data']);
$redirect_url = ($_SESSION['role'] == "Admin") ? 'queue_display_admin.php' : 'queue_display.php';
$currentDateTime = date('M j, Y g:i A');
echo "<pre>";
print_r($ticket);
echo "</pre>";
// exit();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=80mm, initial-scale=1.0">
  <title>Queue Ticket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    @page {
      size: 80mm 120mm;
      margin: 0;
    }
    body {
      font-family: 'Arial', sans-serif;
      width: 76mm;
      margin: 2mm auto;
      padding: 3mm;
      border: 2px solid #1a5276;
      border-radius: 8px;
      background: white;
    }
    .ticket-header {
      text-align: center;
      margin-bottom: 4mm;
      padding-bottom: 3mm;
      border-bottom: 2px dashed #1a5276;
    }
    .ticket-header h2 {
      color: #1a5276;
      font-size: 16px;
      margin: 0;
      font-weight: bold;
    }
    .ticket-header p {
      font-size: 10px;
      margin: 2mm 0 0 0;
    }
    .ticket-number {
      background: #1a5276;
      color: white;
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      margin: 4mm 0;
      padding: 3mm;
      border-radius: 5px;
      box-shadow: 0 2px 3px rgba(0,0,0,0.1);
    }
    .ticket-detail {
      margin-bottom: 3mm;
      padding-bottom: 3mm;
      border-bottom: 1px dashed #aaa;
      display: flex;
      align-items: center;
    }
    .detail-label {
      font-weight: bold;
      color: #1a5276;
      width: 30mm;
      display: flex;
      align-items: center;
    }
    .detail-label i {
      margin-right: 2mm;
      width: 5mm;
      text-align: center;
    }
    .detail-value {
      flex: 1;
      padding-left: 3mm;
      word-break: break-word;
    }
    .print-btn {
      background: #1a5276;
      color: white;
      border: none;
      padding: 3mm 5mm;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
      margin-top: 5mm;
      width: 100%;
    }
    @media print {
      .no-print {
        display: none !important;
      }
      body {
        border: none;
        padding: 0;
        margin: 0 auto;
      }
      .ticket-number {
        box-shadow: none;
      }
    }
  </style>
</head>
<body>
  <div class="ticket-header">
    <h2><i class="fas fa-hospital"></i> HOSPITAL QUEUE SYSTEM</h2>
    <p>QUEUE TICKET</p>
  </div>
  
  <div class="ticket-number">
    <?= htmlspecialchars($ticket['queue_num']) ?>
  </div>
  
  <div class="ticket-detail">
    <div class="detail-label">
        <i class="fas fa-building"></i>Department:
    </div>
    <div class="detail-value">
        <?= htmlspecialchars($ticket['department'] ?? 'General Department', 
            ENT_QUOTES, 'UTF-8') ?>
    </div>
</div>
  
  <div class="ticket-detail">
    <div class="detail-label"><i class="fas fa-procedures"></i>Services:</div>
    <div class="detail-value"><?= htmlspecialchars($ticket['services']) ?></div>
  </div>
  
  <div class="ticket-detail">
    <div class="detail-label"><i class="fas fa-exclamation"></i>Priority:</div>
    <div class="detail-value"><?= htmlspecialchars(ucwords(str_replace('_', ' ', $ticket['priority']))) ?></div>
  </div>
  
  <div class="ticket-detail">
    <div class="detail-label"><i class="fas fa-clock"></i>Date & Time:</div>
    <div class="detail-value"><?= $currentDateTime ?></div>
  </div>

  <div class="no-print" style="text-align: center;">
    <button onclick="window.print()" class="print-btn">
      <i class="fas fa-print"></i> PRINT TICKET
    </button>
  </div>

  <script>
    window.onafterprint = function() {
      window.location.href = "<?= $redirect_url ?>";
    };
  </script>
</body>
</html>