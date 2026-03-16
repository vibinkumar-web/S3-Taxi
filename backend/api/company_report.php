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

$company   = isset($_GET['company'])   ? $_GET['company']   : '';
$from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
$to_date   = isset($_GET['to_date'])   ? $_GET['to_date']   : '';

if ($from_date && $to_date) {

    // f_trip_sheet_entry does not exist — use f_closing.
    // to_whom stores company name (or 'Public' for individual passengers).
    $query = "SELECT c.bid                          AS trip_id,
                     c.customer                     AS guest_name,
                     c.p_date                       AS date,
                     c.picup_place                  AS pickup_city,
                     c.drop_place                   AS drop_city,
                     c.v_type,
                     c.v_id                         AS vechile_no,
                     (c.closing_km - c.opening_km)  AS total_km,
                     c.net_total                    AS total_amt,
                     c.to_whom                      AS company_name
              FROM f_closing c
              WHERE c.p_date BETWEEN :from_date AND :to_date";

    if ($company && $company !== 'All') {
        $query .= " AND c.to_whom = :company";
    }

    $query .= " ORDER BY c.p_date DESC, c.id DESC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(":from_date", $from_date);
    $stmt->bindParam(":to_date",   $to_date);

    if ($company && $company !== 'All') {
        $stmt->bindParam(":company", $company);
    }

    $stmt->execute();

    $data = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        array_push($data, $row);
    }
    echo json_encode($data);

} elseif (isset($_GET['list'])) {
    // Return distinct company/recipient names stored in to_whom
    $query = "SELECT DISTINCT to_whom FROM f_closing
              WHERE to_whom IS NOT NULL AND to_whom != ''
              ORDER BY to_whom";
    $stmt = $db->prepare($query);
    $stmt->execute();
    echo json_encode($stmt->fetchAll(PDO::FETCH_COLUMN));

} else {
    echo json_encode(array());
}
?>
