<?php
require_once '../config/cors.php';
session_start();
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/db.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    $from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
    $to_date   = isset($_GET['to_date'])   ? $_GET['to_date']   : '';

    $query  = "SELECT cb.b_date, cb.b_id, cb.reason,
                      cb.b_name  AS customer_name,
                      cb.m_no    AS mobile,
                      s.name     AS staff_name
               FROM f_calcel_booking cb
               LEFT JOIN ft_staff s ON cb.user_id = s.emp_id
               WHERE cb.b_date != '0000-00-00'";
    $params = [];

    if ($from_date && $to_date) {
        $query .= " AND cb.b_date BETWEEN :from_date AND :to_date";
        $params[':from_date'] = $from_date;
        $params[':to_date']   = $to_date;
    }
    $query .= " ORDER BY cb.b_date DESC";

    $stmt = $db->prepare($query);
    foreach ($params as $k => $v) $stmt->bindValue($k, $v);
    $stmt->execute();

    $data = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) $data[] = $row;
    echo json_encode($data);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(array("message" => "Database error: " . $e->getMessage()));
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(array("message" => "General error: " . $e->getMessage()));
}
?>
