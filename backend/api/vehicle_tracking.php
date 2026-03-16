<?php
$allowed_origins = array_filter(array_map('trim', explode(',',
    getenv('ALLOWED_ORIGINS') ?: 'http://localhost:5173,http://localhost:5174,http://localhost:5175'
)));
$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
if (in_array($origin, $allowed_origins)) {
    header("Access-Control-Allow-Origin: " . $origin);
} else {
    header("Access-Control-Allow-Origin: " . reset($allowed_origins));
}
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(200); exit; }

session_start();
include_once '../config/db.php';

$database = new Database();
$db = $database->getConnection();

$query = "SELECT
            l.id_emp       AS v_id,
            l.login_time,
            v.vacant_place,
            v.v_no,
            v.d_name,
            v.v_cat,
            v.v_model,
            v.d_mobile,
            ot.b_id,
            ot.b_name,
            ot.m_no,
            ot.p_city,
            ot.d_place,
            ot.t_type,
            ot.ac_type,
            ot.open_km,
            ot.assign_time,
            ot.on_trip_status
          FROM (
              SELECT id_emp, MAX(login_time) AS login_time
              FROM f_login_status
              WHERE login_status = '1'
              GROUP BY id_emp
          ) l
          JOIN f_v_attach v ON l.id_emp = v.v_id
          LEFT JOIN (
              SELECT ot1.*
              FROM f_ontrip ot1
              INNER JOIN (
                  SELECT v_id, MAX(id) AS max_id
                  FROM f_ontrip
                  WHERE already_assign = '1'
                  GROUP BY v_id
              ) latest ON ot1.id = latest.max_id
          ) ot ON ot.v_id = l.id_emp
          ORDER BY l.login_time DESC";

$stmt = $db->prepare($query);
$stmt->execute();

$vehicles  = [];
$on_trip   = 0;
$available = 0;

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    if (!empty($row['assign_time'])) {
        $row['status_label'] = $row['on_trip_status'] === '1' ? 'On Trip' : 'Assigned';
        $on_trip++;
    } else {
        $row['status_label'] = 'Available';
        $available++;
    }
    $vehicles[] = $row;
}

// Pending assignments (bookings not yet dispatched)
$paStmt = $db->prepare("SELECT COUNT(*) as cnt FROM f_ft_booking WHERE assign = '0' AND (booking_status != '1' OR booking_status IS NULL)");
$paStmt->execute();
$pending_assignments = (int)$paStmt->fetchColumn();

echo json_encode([
    'summary' => [
        'total'               => count($vehicles),
        'pending_assignments' => $pending_assignments,
        'on_trip'             => $on_trip,
        'available'           => $available,
    ],
    'vehicles' => $vehicles,
]);
?>
