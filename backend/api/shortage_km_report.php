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

$v_id = isset($_GET['v_id']) ? $_GET['v_id'] : '';

if ($v_id) {
    // Fetch all trips for this vehicle ordered by date and time
    $query = "SELECT c.b_id, c.bid, c.opening_km, c.closing_km, c.p_date, c.pickup_time,
                     v.v_no, v.d_name AS v_name
              FROM f_closing c
              LEFT JOIN f_v_attach v ON c.v_id = v.v_id
              WHERE c.v_id = :v_id
              ORDER BY c.p_date ASC, c.pickup_time ASC, c.id ASC";
              
    $stmt = $db->prepare($query);
    $stmt->bindParam(":v_id", $v_id);
    $stmt->execute();
    
    $trips = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $shortages = [];
    
    // Sequential Comparison Logic
    for ($i = 1; $i < count($trips); $i++) {
        $prev_trip = $trips[$i - 1];
        $curr_trip = $trips[$i];
        
        // A shortage occurs if the Next Trip's Opening KM is Higher than Previous Trip's Closing KM
        $gap = $curr_trip['opening_km'] - $prev_trip['closing_km'];
        
        if ($gap > 0) {
            $shortages[] = [
                'v_name' => $curr_trip['v_name'],
                'v_no' => $curr_trip['v_no'],
                'b_id' => $curr_trip['b_id'] ?: $curr_trip['bid'],
                'prev_closing_km' => $prev_trip['closing_km'],
                'curr_opening_km' => $curr_trip['opening_km'],
                'shortage_km' => $gap,
                'date' => $curr_trip['p_date'],
                'time' => $curr_trip['pickup_time']
            ];
        }
    }

    echo json_encode($shortages);

} else {
     echo json_encode(array("message" => "Vehicle ID parameter required"));
}
?>
