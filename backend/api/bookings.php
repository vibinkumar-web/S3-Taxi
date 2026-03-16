<?php
require_once '../config/cors.php';
session_start();
include_once '../config/db.php';


$database = new Database();
$db = $database->getConnection();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    // Return next booking ID and total count
    if (isset($_GET['action']) && $_GET['action'] === 'next_id') {
        $stmtMax = $db->prepare("SELECT COUNT(*) as total, COALESCE(MAX(b_id), 0) as max_id FROM f_ft_booking");
        $stmtMax->execute();
        $row = $stmtMax->fetch(PDO::FETCH_ASSOC);
        $total = (int)$row['total'];
        $next_id = (int)$row['max_id'] + 1;
        echo json_encode(['next_id' => $next_id, 'last_id' => $total, 'total' => $total]);
        exit;
    }

    $conditions = [];
    $params = [];

    $from_date = isset($_GET['from_date']) ? trim($_GET['from_date']) : '';
    $to_date   = isset($_GET['to_date'])   ? trim($_GET['to_date'])   : '';
    $status    = isset($_GET['status'])    ? trim($_GET['status'])    : '';
    $search    = isset($_GET['search'])    ? trim($_GET['search'])    : '';
    $page      = max(1, (int)($_GET['page'] ?? 1));
    $limit     = min(100, max(10, (int)($_GET['limit'] ?? 50)));
    $offset    = ($page - 1) * $limit;
    $all       = isset($_GET['all']) && $_GET['all'] === '1';

    if ($from_date) { $conditions[] = "b_date >= :from_date"; $params[':from_date'] = $from_date; }
    if ($to_date)   { $conditions[] = "b_date <= :to_date";   $params[':to_date']   = $to_date; }
    if ($status === 'assigned') { $conditions[] = "assign = '1'"; }
    if ($status === 'awaiting') { $conditions[] = "assign = '0'"; }
    if ($search) {
        $conditions[] = "(b_name LIKE :search OR m_no LIKE :search OR b_id = :search_id)";
        $params[':search']    = '%' . $search . '%';
        $params[':search_id'] = is_numeric($search) ? (int)$search : -1;
    }

    // Only default to today if no filters AND not ?all=1
    if (!$all && !$from_date && !$to_date && !$status && !$search) {
        $conditions[] = "b_date >= CURDATE()";
    }

    $where = count($conditions) ? 'WHERE ' . implode(' AND ', $conditions) : '';

    $countStmt = $db->prepare("SELECT COUNT(*) FROM f_ft_booking $where");
    foreach ($params as $k => $v) $countStmt->bindValue($k, $v);
    $countStmt->execute();
    $total = (int)$countStmt->fetchColumn();

    $stmt = $db->prepare("SELECT * FROM f_ft_booking $where ORDER BY b_id DESC LIMIT :limit OFFSET :offset");
    foreach ($params as $k => $v) $stmt->bindValue($k, $v);
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();

    echo json_encode([
        'bookings' => $stmt->fetchAll(PDO::FETCH_ASSOC),
        'total'    => $total,
        'page'     => $page,
        'pages'    => (int)ceil($total / $limit),
        'limit'    => $limit,
    ]);

} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (
        !empty($data->pickup) &&
        !empty($data->m_no)
    ) {
        // Calculate b_id using MAX(b_id) + 1 to avoid duplicates when bookings are deleted
        $stmtCount = $db->prepare("SELECT COALESCE(MAX(b_id), 0) FROM f_ft_booking");
        $stmtCount->execute();
        $b_id = (int)$stmtCount->fetchColumn() + 1;

        $query = "INSERT INTO f_ft_booking SET
            b_id = :b_id,
            pickup = :pickup,
            b_date = :b_date,
            d_place = :d_place,
            to_whom = :to_whom,
            a_no = :a_no,
            cus_count = :cus_count,
            p_city = :p_city,
            r_status = :r_status,
            m_no = :m_no,
            v_type = :v_type,
            st = :st,
            t_type = :t_type,
            b_name = :b_name,
            ac_type = :ac_type,
            b_type = :b_type,
            remarks = :remarks,
            b_now = '0',
            assign = '0',
            user_id = :user_id";

        $stmt = $db->prepare($query);

        $stmt->bindParam(":b_id", $b_id);
        $stmt->bindParam(":pickup", $data->pickup);
        
        // Handle dates
        $timestamp = strtotime($data->pickup);
        $b_date = date('Y-m-d', $timestamp); // Or however legacy system handles it
        // Note: legacy uses $date_only_new = date('Y-m-d',$timestampss); which is b_date
        
        $stmt->bindParam(":b_date", $b_date);
        $stmt->bindParam(":d_place", $data->d_place);
        $stmt->bindParam(":to_whom", $data->to_whom);
        $stmt->bindParam(":a_no", $data->a_no);
        $stmt->bindParam(":cus_count", $data->cus_count);
        $stmt->bindParam(":p_city", $data->p_city);
        $stmt->bindParam(":r_status", $data->r_status);
        $stmt->bindParam(":m_no", $data->m_no);
        $stmt->bindParam(":v_type", $data->v_type);
        $stmt->bindParam(":st", $data->st);
        $stmt->bindParam(":t_type", $data->t_type);
        $stmt->bindParam(":b_name", $data->b_name);
        $stmt->bindParam(":ac_type", $data->ac_type);
        $stmt->bindParam(":b_type", $data->b_type);
        $stmt->bindParam(":remarks", $data->remarks);
        $stmt->bindParam(":user_id", $data->user_id);

        try {
            if ($stmt->execute()) {
                http_response_code(201);
                echo json_encode(array("message" => "Booking created.", "b_id" => $b_id));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Unable to create booking. Execute returned false."));
            }
        } catch (PDOException $e) {
            http_response_code(503);
            echo json_encode(array("message" => "Database Error: " . $e->getMessage()));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Unable to create booking. Data is incomplete."));
    }
}
?>
