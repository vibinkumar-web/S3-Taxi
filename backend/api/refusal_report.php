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

    $v_id = isset($_GET['v_id']) ? $_GET['v_id'] : '';
    $from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
    $to_date = isset($_GET['to_date']) ? $_GET['to_date'] : '';

    if ($from_date && $to_date) {
        
        // f_refused stores pickup, p_city, d_place at the time of refusal.
        // The old JOIN on f_ft_booking used non-existent columns (b.cus_name, b.drop_place).
        // Read directly from f_refused and alias 'reason' -> 'reason_for' to match frontend.
        $query = "SELECT r.date_refused, r.b_id, r.v_id,
                         r.reason   AS reason_for,
                         r.pickup,
                         r.p_city,
                         r.d_place  AS drop_place
                  FROM f_refused r
                  WHERE r.date_refused BETWEEN :from_date AND :to_date";
                  
        if ($v_id && $v_id !== 'All') {
            $query .= " AND r.v_id = :v_id";
        }
        $query .= " ORDER BY r.date_refused DESC";
        
        $stmt = $db->prepare($query);
        $stmt->bindParam(":from_date", $from_date);
        
        // Adjust to_date to include the full day
        $to_date_full = $to_date . " 23:59:59";
        $stmt->bindParam(":to_date", $to_date_full);
        
        if ($v_id && $v_id !== 'All') {
            $stmt->bindParam(":v_id", $v_id);
        }
        
        $stmt->execute();
        
        $data = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            array_push($data, $row);
        }
        echo json_encode($data);

    } elseif (isset($_GET['list'])) {
        // Get list of vehicle IDs present in refusals
        $query = "SELECT DISTINCT v_id FROM f_refused ORDER BY v_id";
        $stmt = $db->prepare($query);
        $stmt->execute();
        echo json_encode($stmt->fetchAll(PDO::FETCH_COLUMN));
    } else {
         echo json_encode(array());
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(array("message" => "Database error: " . $e->getMessage()));
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(array("message" => "General error: " . $e->getMessage()));
}
?>

