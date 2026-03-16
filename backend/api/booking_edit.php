<?php
require_once '../config/cors.php';
session_start();
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT, OPTIONS");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");



include_once '../config/db.php';

$database = new Database();
$db = $database->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->b_id)) {
    http_response_code(400);
    echo json_encode(array("message" => "Booking ID is required."));
    exit;
}

// Update f_ft_booking with correct DB column names
$query = "UPDATE f_ft_booking SET
            b_name   = :b_name,
            m_no     = :m_no,
            pickup   = :pickup,
            p_city   = :p_city,
            d_place  = :d_place,
            v_type   = :v_type,
            b_type   = :b_type,
            ac_type  = :ac_type,
            remarks  = :remarks
          WHERE b_id = :b_id";

$stmt = $db->prepare($query);

$stmt->bindParam(":b_name",  $data->b_name);
$stmt->bindParam(":m_no",    $data->m_no);
$stmt->bindParam(":pickup",  $data->pickup);
$stmt->bindParam(":p_city",  $data->p_city);
$stmt->bindParam(":d_place", $data->d_place);
$stmt->bindParam(":v_type",  $data->v_type);
$stmt->bindParam(":b_type",  $data->b_type);
$stmt->bindParam(":ac_type", $data->ac_type);
$stmt->bindParam(":remarks", $data->remarks);
$stmt->bindParam(":b_id",    $data->b_id);

if ($stmt->execute()) {
    echo json_encode(array("message" => "Booking Updated Successfully."));
} else {
    http_response_code(503);
    echo json_encode(array("message" => "Unable to update booking.", "error" => $stmt->errorInfo()));
}
?>


