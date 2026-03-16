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

try {
    $query = "SELECT 
                b.b_id AS bid,
                b.b_date AS p_date,
                b.b_name AS customer,
                b.m_no,
                b.p_city AS picup_place,
                b.d_place AS drop_place,
                b.v_type,
                b.assign,
                b.r_status
              FROM f_ft_booking b
              ORDER BY b.b_date DESC, b.b_id DESC";

    $stmt = $db->prepare($query);
    $stmt->execute();
    
    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($records);
} catch (Exception $e) {
    echo json_encode(array("message" => "Error processing report", "error" => $e->getMessage()));
}
?>
