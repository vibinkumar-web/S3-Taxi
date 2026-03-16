<?php
// CORS headers must be first — before session_start and any other output
$allowed_origins = array_filter(array_map('trim', explode(',',
    getenv('ALLOWED_ORIGINS') ?: 'http://localhost:5173,http://localhost:5174,http://localhost:5175'
)));
$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
if (in_array($origin, $allowed_origins)) {
    header("Access-Control-Allow-Origin: " . $origin);
} else {
    header("Access-Control-Allow-Origin: " . reset($allowed_origins));
}
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

session_start();
include_once '../config/db.php';

$database = new Database();
$db = $database->getConnection();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    // last_km action: return last closing KM for a vehicle
    if (isset($_GET['action']) && $_GET['action'] === 'last_km') {
        $v_id = isset($_GET['v_id']) ? trim($_GET['v_id']) : '';
        if (empty($v_id)) {
            echo json_encode(['last_km' => 0]);
            exit;
        }
        $stmt = $db->prepare("SELECT MAX(CAST(closing_km AS UNSIGNED)) AS max_km FROM f_closing WHERE v_id = :v_id");
        $stmt->bindParam(':v_id', $v_id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode(['last_km' => (int)($row['max_km'] ?? 0)]);
        exit;
    }

    // Fetch assigned trips
    $query = "SELECT * FROM f_ontrip WHERE already_assign = '1' ORDER BY bookin_time DESC";
    $stmt = $db->prepare($query);
    $stmt->execute();
    $data = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        array_push($data, $row);
    }
    echo json_encode($data);

} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"));
    $action = isset($data->action) ? $data->action : '';

    if ($action === 'start_trip') {
        // Update login_status to 1 (Legacy: btnsubmit for status)
        $v_id = $data->v_id;
        $query = "UPDATE f_login_status SET login_status = '1' WHERE id_emp = :v_id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(":v_id", $v_id);
        
        if ($stmt->execute()) {
            echo json_encode(array("message" => "Trip status updated."));
        } else {
            http_response_code(503);
            echo json_encode(array("message" => "Failed to update trip status."));
        }

    } elseif ($action === 'save_opening_km') {
        // Update Opening KM
        $v_id = $data->v_id;
        $opening_km = $data->opening_km;
        
        // Validation: Check against last closing KM
        $query_check = "SELECT MAX(CAST(closing_km AS UNSIGNED)) AS max_km FROM f_closing WHERE v_id = :v_id";
        $stmt_check = $db->prepare($query_check);
        $stmt_check->bindParam(":v_id", $v_id);
        $stmt_check->execute();
        $row_check = $stmt_check->fetch(PDO::FETCH_ASSOC);
        $last_closing_km = $row_check['max_km'] ? $row_check['max_km'] : 0;
        
        // Validate: opening KM must be >= last closing KM
        if ($last_closing_km > 0 && $opening_km < $last_closing_km) {
            http_response_code(400);
            echo json_encode(array("message" => "Opening KM ($opening_km) cannot be less than last closing KM ($last_closing_km). Please enter a valid odometer reading."));
            exit;
        }
        
        date_default_timezone_set('Asia/Kolkata');
        $current_time = date("Y-m-d H:i");
        $new_opening = ($last_closing_km > 0) ? ($last_closing_km - $opening_km) : 0; // Legacy logic seems to be last - open? Wait, legacy: $new_one = $last_ckm - $opening_km; 
        // Actually legacy logic $old_km < $opening_km check implies Opening should be GREATER.
        // Legacy: if ( $old_km < $opening_km) -> OK. 
        // My check above: if ($opening_km < $last_closing_km) -> Error. So Opening must be >= Last Closing. Correct.
        // Legacy $new_one calculation: $last_ckm - $opening_km. If Opening > Last, this is negative? 
        // Let's look at legacy: $new_one = $last_ckm - $opening_km; 
        // This likely tracks the 'gap' or dead mileage if any, but usually Opening == Last Closing.
        // If Opening > Last Closing, there is a gap. 
        // If I strictly follow legacy:
        if ($opening_km < $last_closing_km) {
             $new_opening = 0; // Negative distance is invalid, so gap is 0
        } else {
             $new_opening = $opening_km - $last_closing_km; // Corrected math: diff is Current (Opening) - Previous (Closing)
        }

        $query = "UPDATE f_ontrip SET open_km = :opening_km, new_opening = :new_opening, bookin_time = :bookin_time WHERE already_assign = '1' AND v_id = :v_id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(":opening_km", $opening_km);
        $stmt->bindParam(":new_opening", $new_opening);
        $stmt->bindParam(":bookin_time", $current_time);
        $stmt->bindParam(":v_id", $v_id);
        
        if ($stmt->execute()) {
             echo json_encode(array("message" => "Opening KM saved successfully."));
        } else {
             http_response_code(503);
             echo json_encode(array("message" => "Failed to save Opening KM."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Invalid action."));
    }
}
?>


