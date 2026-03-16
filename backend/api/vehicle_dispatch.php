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
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(200); exit; }

session_start();
include_once '../config/db.php';

$database = new Database();
$db = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["message" => "Method not allowed."]);
    exit;
}

$data    = json_decode(file_get_contents("php://input"));
$action  = isset($data->action) ? trim($data->action) : 'dispatch';
$v_id    = isset($data->v_id)   ? trim($data->v_id)   : '';

if (!$v_id) {
    http_response_code(400);
    echo json_encode(["message" => "Vehicle ID is required."]);
    exit;
}

// ─── RECALL (return dispatched vehicle to available) ───────────────────────
if ($action === 'recall') {
    // Only recall standalone dispatches (those without a booking b_id)
    $upd = $db->prepare(
        "UPDATE f_ontrip SET already_assign = '0', on_trip_status = '0'
         WHERE v_id = :v_id AND already_assign = '1' AND (b_id IS NULL OR b_id = '')"
    );
    $upd->bindParam(':v_id', $v_id);
    $upd->execute();

    // Reset f_login_status
    $rst = $db->prepare(
        "UPDATE f_login_status SET ontrip_status = '0', status_assign = '0'
         WHERE id_emp = :v_id AND login_status = '1'"
    );
    $rst->bindParam(':v_id', $v_id);
    $rst->execute();

    echo json_encode(["status" => "success", "message" => "Vehicle $v_id recalled successfully."]);
    exit;
}

// ─── DISPATCH ──────────────────────────────────────────────────────────────
$destination = isset($data->destination) ? trim($data->destination) : '';

// Verify vehicle exists and is currently active (logged in)
$chk = $db->prepare(
    "SELECT v.v_id, v.v_no, v.d_name, v.d_mobile, v.v_type
     FROM f_v_attach v
     INNER JOIN f_login_status ls ON ls.id_emp = v.v_id AND ls.login_status = '1'
     WHERE v.v_id = :v_id"
);
$chk->bindParam(':v_id', $v_id);
$chk->execute();
$vehicle = $chk->fetch(PDO::FETCH_ASSOC);

if (!$vehicle) {
    http_response_code(404);
    echo json_encode(["message" => "Vehicle not found or not currently active."]);
    exit;
}

// Verify vehicle is not already dispatched
$chkDispatch = $db->prepare(
    "SELECT id FROM f_ontrip WHERE v_id = :v_id AND already_assign = '1'"
);
$chkDispatch->bindParam(':v_id', $v_id);
$chkDispatch->execute();
if ($chkDispatch->fetch()) {
    http_response_code(409);
    echo json_encode(["message" => "Vehicle $v_id is already dispatched."]);
    exit;
}

date_default_timezone_set('Asia/Kolkata');
$now = date('Y-m-d H:i:s');

// Insert dispatch record into f_ontrip (b_id left empty to identify standalone dispatch)
$insert = $db->prepare(
    "INSERT INTO f_ontrip
        (v_id, d_place, assign_time, on_trip_status, already_assign, v_type, d_mobile)
     VALUES
        (:v_id, :d_place, :assign_time, '1', '1', :v_type, :d_mobile)"
);
$insert->bindParam(':v_id',        $vehicle['v_id']);
$insert->bindParam(':d_place',     $destination);
$insert->bindParam(':assign_time', $now);
$insert->bindParam(':v_type',      $vehicle['v_type'] ?? '');
$insert->bindParam(':d_mobile',    $vehicle['d_mobile'] ?? '');

if (!$insert->execute()) {
    http_response_code(500);
    echo json_encode(["message" => "Failed to create dispatch record."]);
    exit;
}

// Mark vehicle as on-trip in f_login_status
$upd = $db->prepare(
    "UPDATE f_login_status SET ontrip_status = '1', status_assign = '1'
     WHERE id_emp = :v_id AND login_status = '1'"
);
$upd->bindParam(':v_id', $v_id);
$upd->execute();

echo json_encode([
    "status"  => "success",
    "message" => "Vehicle $v_id dispatched successfully."
]);
?>
