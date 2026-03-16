<?php
include_once 'backend/config/db.php';
$database = new Database();
$db = $database->getConnection();
$query = "SELECT c.*, v.v_no, v.d_name AS v_name FROM f_closing c LEFT JOIN f_v_attach v ON c.v_id = v.v_id WHERE c.v_id = '252'";
$stmt = $db->prepare($query);
$stmt->execute();
$trips = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($trips);
?>
