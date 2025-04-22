<?php
session_start();
require('lib/conn.php');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("HTTP/1.1 405 Method Not Allowed");
    exit();
}

// Validate inputs
$department_id = $_POST['department_id'] ?? null;
$services = $_POST['services'] ?? [];
$priority = $_POST['priority'] ?? null;

if (!$department_id || empty($services) || !$priority) {
    header("HTTP/1.1 400 Bad Request");
    echo json_encode(['error' => 'Missing required fields']);
    exit();
}

// Department ID to prefix mapping
$departmentPrefixes = [
    1 => 'BIL-',    // Billing
    2 => 'PHA-',   // Pharmacy
    3 => 'MED-',    // Medical Records
    4 => 'ULT-',    // Ultra-sound
    5 => 'XR-',     // X-ray
    6 => 'REH-',    // Rehabilitation
    7 => 'DIA-',    // Dialysis
    8 => 'LAB-',    // Laboratory
    9 => 'ADM-',    // Admitting
    10 => 'HMO-',   // HMO
    11 => 'INF-',   // Information
    13 => 'ER-',   // Emergency Room
    14 => 'SW-'   // Social Worker
];

// Get the prefix for the department
$prefix = $departmentPrefixes[$department_id] ?? 'GEN';

// Fetch the last queue number globally (regardless of department)
$stmt = $conn->prepare("SELECT queue_num FROM queues ORDER BY qid DESC LIMIT 1");
$stmt->execute();
$lastQueue = $stmt->fetch(PDO::FETCH_ASSOC);

// Extract numeric part from the last queue number
if ($lastQueue && preg_match('/(\d+)$/', $lastQueue['queue_num'], $matches)) {
    $lastNum = intval($matches[1]);
} else {
    $lastNum = 0;
}

// Increment queue number
$lastNum++;
$numericPart = str_pad($lastNum, 3, '0', STR_PAD_LEFT);
$queue_num = $prefix . $numericPart;

// Get department name
$stmt = $conn->prepare("SELECT name FROM departments WHERE dept_id = :dept_id");
$stmt->execute([':dept_id' => $department_id]);
$department = $stmt->fetch(PDO::FETCH_ASSOC);

// Prepare response
$response = [
    'queue_num' => $queue_num,
    'department' => $department['name'],
    'services' => implode(", ", $services),
    'priority' => ucwords(str_replace('_', ' ', $priority)),
    'timestamp' => date('Y-m-d H:i:s')
];

header('Content-Type: application/json');
echo json_encode($response);
?>
