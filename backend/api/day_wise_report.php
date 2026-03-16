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

$from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
$to_date   = isset($_GET['to_date'])   ? $_GET['to_date']   : '';

if ($from_date && $to_date) {

    // f_trip_sheet_entry does not exist — use f_closing which holds all completed trip data.
    // Column mapping: bid=trip_id, v_id=vechile_no, to_whom=company_name,
    //                 customer=guest_name, net_total=total_amt, p_date=date
    $query = "SELECT c.bid       AS trip_id,
                     c.v_id      AS vechile_no,
                     c.to_whom   AS company_name,
                     c.customer  AS guest_name,
                     c.net_total AS total_amt,
                     c.p_date    AS date
              FROM f_closing c
              WHERE c.p_date BETWEEN :from_date AND :to_date
              ORDER BY c.p_date DESC, c.id DESC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(":from_date", $from_date);
    $stmt->bindParam(":to_date",   $to_date);
    $stmt->execute();

    $data = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        array_push($data, $row);
    }
    echo json_encode($data);

} else {
    echo json_encode(array());
}
?>
