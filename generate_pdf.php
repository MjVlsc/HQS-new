<?php
require('lib/conn.php');
require __DIR__ . '/vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

// Get data from POST
$queue_num = $_POST['queue_num'] ?? '';
$department = $_POST['department'] ?? '';
$services = $_POST['services'] ?? '';
$priority = $_POST['priority'] ?? '';

// Create PDF
$options = new Options();
$options->set('isRemoteEnabled', true);
$options->set('defaultFont', 'Courier');

$dompdf = new Dompdf($options);

$html = '
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; }
        .ticket { width: 300px; margin: 0 auto; border: 2px solid #000; padding: 20px; text-align: center; }
        .header { font-size: 18px; font-weight: bold; margin-bottom: 15px; }
        .queue-number { font-size: 32px; font-weight: bold; color: #d00; margin: 15px 0; }
        .details { text-align: left; margin: 15px 0; }
        .detail-item { margin: 8px 0; }
        .footer { margin-top: 20px; font-size: 12px; color: #666; }
        .barcode { margin: 15px 0; }
    </style>
</head>
<body>
    <div class="ticket">
        <div class="header">Hospital Queue System</div>
        <div class="queue-number">' . htmlspecialchars($queue_num) . '</div>
        
        <div class="details">
            <div class="detail-item"><strong>Department:</strong> ' . htmlspecialchars($department) . '</div>
            <div class="detail-item"><strong>Services:</strong> ' . htmlspecialchars($services) . '</div>
            <div class="detail-item"><strong>Priority:</strong> ' . htmlspecialchars($priority) . '</div>
            <div class="detail-item"><strong>Time:</strong> ' . date('Y-m-d H:i:s') . '</div>
        </div>
        
       
        
        <div class="footer">
            Please wait for your number to be called
        </div>
    </div>
</body>
</html>
';

$dompdf->loadHtml($html);
$dompdf->setPaper('A6', 'portrait');
$dompdf->render();

// Output the generated PDF
$dompdf->stream("ticket_$queue_num.pdf", ["Attachment" => true]);
?>
