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
    
    // Fetch trips — JOIN f_v_attach (f_vehicle_register doesn't exist in this DB)
    $query = "SELECT c.*, v.v_no, v.d_name AS v_name
              FROM f_closing c
              LEFT JOIN f_v_attach v ON c.v_id = v.v_id
              WHERE c.v_id = :v_id
              ORDER BY c.p_date ASC";
              
    $stmt = $db->prepare($query);
    $stmt->bindParam(":v_id", $v_id);
    $stmt->execute();
    
    $trips = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Calculate Totals
    $totals = [
        'running_km' => 0,
        'net_total' => 0,
        'paid_amount' => 0,
        'discount' => 0,
        'pending_amount' => 0
    ];
    
    foreach ($trips as $trip) {
        $running = (float)($trip['closing_km'] ?? 0) - (float)($trip['opening_km'] ?? 0);
        $totals['running_km'] += $running;
        $totals['net_total'] += (float)($trip['net_total'] ?? 0);
        $totals['paid_amount'] += (float)($trip['paid_amount'] ?? 0);
        $totals['discount'] += (float)($trip['discount'] ?? 0);
        
        $net_total = (float)($trip['net_total'] ?? 0);
        $paid_amount = (float)($trip['paid_amount'] ?? 0);
        if ($net_total > $paid_amount) {
             $totals['pending_amount'] += ($net_total - $paid_amount);
        }
    }

    echo json_encode(['trips' => $trips, 'totals' => $totals]);

} else {
     echo json_encode(array("message" => "Parameters required"));
}
?>

