<?php
require_once '../config/cors.php';
session_start();
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/db.php';

$database = new Database();
$db = $database->getConnection();

$emp_id = isset($_GET['emp_id']) ? $_GET['emp_id'] : '';

if (isset($_GET['action']) && $_GET['action'] === 'salary_summary') {
    $emp_id = isset($_GET['emp_id']) ? $_GET['emp_id'] : '';
    if (!$emp_id) { echo json_encode(['error' => 'Employee ID is required']); exit; }

    $first_day = date('Y-m-01');
    $last_day  = date('Y-m-t');
    $query = "SELECT * FROM f_login_status
              WHERE id_emp = :emp_id AND logout_date_new BETWEEN :from_date AND :to_date
              ORDER BY login_time DESC";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":emp_id",    $emp_id);
    $stmt->bindParam(":from_date", $first_day);
    $stmt->bindParam(":to_date",   $last_day);
    $stmt->execute();

    $shifts   = [];
    $total_ms = 0;
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $duration_str = '-';
        if ($row['logout'] && $row['logout'] !== '0000-00-00 00:00:00') {
            $diff = strtotime($row['logout']) - strtotime($row['login_time']);
            if ($diff > 0) {
                $total_ms += $diff;
                $duration_str = floor($diff / 3600) . 'h ' . floor(($diff % 3600) / 60) . 'm';
            }
        }
        $row['duration_formatted'] = $duration_str;
        $shifts[] = $row;
    }
    $total_hrs  = floor($total_ms / 3600);
    $total_mins = floor(($total_ms % 3600) / 60);
    echo json_encode([
        'total_duration' => "{$total_hrs}h {$total_mins}m",
        'total_decimal'  => round($total_hrs + ($total_mins / 60), 2),
        'shifts'         => array_slice($shifts, 0, 10),
    ]);
    exit;
}

if (isset($_GET['list'])) {
    $query = "SELECT DISTINCT id_emp FROM f_login_status WHERE v_type IS NULL ORDER BY id_emp";
    $stmt  = $db->prepare($query);
    $stmt->execute();
    echo json_encode($stmt->fetchAll(PDO::FETCH_COLUMN));
    exit;
}

// JOIN with tms_staff to get full staff details
$query  = "SELECT 
              ls.*,
              s.name AS staff_name,
              s.email AS staff_email,
              s.mobile AS staff_mobile,
              s.department AS staff_department
           FROM f_login_status ls
           LEFT JOIN tms_staff s ON ls.id_emp = s.username OR ls.id_emp = s.mobile
           WHERE 1=1";
$params = [];

if ($emp_id && $emp_id !== 'All') {
    $query .= " AND ls.id_emp = :emp_id";
    $params[':emp_id'] = $emp_id;
}

$query .= " ORDER BY ls.login_time DESC";

$stmt = $db->prepare($query);
foreach ($params as $k => $v) $stmt->bindValue($k, $v);
$stmt->execute();

$data = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    if ($row['logout'] && $row['logout'] !== '0000-00-00 00:00:00') {
        $start = new DateTime($row['login_time']);
        $end   = new DateTime($row['logout']);
        $interval = $start->diff($end);
        $row['duration']       = $interval->format('%d days %H:%I');
        $row['duration_hours'] = ($interval->days * 24) + $interval->h + ($interval->i / 60);
    } else {
        $row['duration']       = 'Active';
        $row['duration_hours'] = 0;
    }
    $data[] = $row;
}
echo json_encode($data);
?>
