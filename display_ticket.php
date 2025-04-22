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
      width: 76mm; /* Reduced to accommodate border */
      height: 48mm;
      margin: 2mm auto; /* Centered with small margins */
      padding: 0 2mm; /* Left/right padding */
      border: 1px solid #000; /* Ticket border */
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
    
    /* Keep your existing styles for other elements */
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
    @media print {
      .no-print {
        display: none !important;
      }
      body {
        padding: 0 2mm;
        margin: 0 auto;
      }
    }
</style>
  <!-- <style>
    @page {
      size: 80mm 100mm;
      margin: 0;
    }
    body {
      font-family: Arial, sans-serif;
      font-size: 10px;
      width: 76mm; /* Reduced to accommodate border */
      height: 100mm;
      margin: 2mm auto; /* Centered with small margins */
      padding: 0 2mm; /* Left/right padding */
      border: 1px solid #000; /* Ticket border */
    }
    .ticket-header {
      text-align: center;
      margin-bottom: 3mm;
      border-bottom: 1px dashed #000;
      padding-bottom: 3mm;
      padding-top: 2mm;
    }
    .ticket-header h2 {
      font-size: 14px;
      margin: 0;
      font-weight: bold;
    }
    .ticket-header p {
      font-size: 10px;
      margin: 2mm 0 0 0;
    }
    .ticket-number {
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      margin: 3mm 0;
    }
    .ticket-detail {
      margin-bottom: 2mm;
      padding-bottom: 2mm;
      border-bottom: 1px dashed #ccc;
      padding-left: 2mm; /* Added left padding */
    }
    .detail-label {
      font-weight: bold;
    }
    @media print {
      .no-print {
        display: none !important;
      }
      body {
        padding: 0 2mm;
        margin: 0 auto;
      }
    }
  </style> -->
</head>
<body>
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


  <div class="no-print" style="text-align: center; margin-top: 5mm; padding-left: 2mm;">
    <button onclick="window.print()" style="padding: 2mm 5mm; font-size: 10px;">Print Ticket</button>
  </div>

  <script>
    window.onafterprint = function() {
      window.location.href = "<?= $redirect_url ?>";
    };
  </script>
</body>
</html>