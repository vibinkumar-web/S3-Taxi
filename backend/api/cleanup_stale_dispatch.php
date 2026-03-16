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

// Reset all stale f_ontrip records where assign_time is NOT from today.
// This safely clears all old/legacy dispatch records without touching same-day trips.
$stmt = $db->prepare(
    "UPDATE f_ontrip SET already_assign = '0'
     WHERE already_assign = '1' AND DATE(assign_time) < CURDATE()"
);
$stmt->execute();
$cleared = $stmt->rowCount();

echo json_encode([
    "status"  => "success",
    "message" => "Cleared $cleared stale dispatch record(s)."
]);
?>
