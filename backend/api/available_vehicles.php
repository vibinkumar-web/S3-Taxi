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
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

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
    $action    = isset($_GET['action'])      ? $_GET['action']              : '';
    $v_cat     = isset($_GET['v_cat'])       ? trim($_GET['v_cat'])         : '';
    $v_model   = isset($_GET['v_model'])     ? trim($_GET['v_model'])       : '';
    // include_all=1 → return entire fleet not on active trip (used for suggestion panel)
    $include_all = isset($_GET['include_all']) && $_GET['include_all'] === '1';

    // ── get_models: distinct model names for a category ──────────────────────
    if ($action === 'get_models') {
        $query = "SELECT DISTINCT v_model FROM f_v_attach WHERE v_model IS NOT NULL AND v_model != ''";
        if (!empty($v_cat)) {
            $query .= " AND v_cat = :v_cat";
        }
        $query .= " ORDER BY v_model ASC";
        $stmt = $db->prepare($query);
        if (!empty($v_cat)) {
            $stmt->bindParam(":v_cat", $v_cat);
        }
        $stmt->execute();
        $models = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            if (!empty($row['v_model'])) {
                $models[] = $row['v_model'];
            }
        }
        echo json_encode($models);
        exit;
    }

    // ── Main query ────────────────────────────────────────────────────────────
    // Source of truth for "active" vehicles: same logic as vehicle_in_out.php
    //   - logged in (login_status = '1')
    //   - GROUP BY v_id to collapse duplicate login rows
    //   - not currently dispatched on an active trip (already_assign = '1')
    //
    // include_all=1 relaxes the login requirement so the suggestion panel can
    // also show fleet vehicles that are offline (marked with login_status flag).

    if ($include_all) {
        // Return all fleet vehicles not on an active trip, with real login_status
        $query = "SELECT
                    f.id, f.v_id, f.v_cat, f.v_brand, f.v_model, f.v_no,
                    f.d_name, f.d_mobile, f.vacant_place,
                    COALESCE((SELECT MAX(CAST(c.closing_km AS UNSIGNED))
                               FROM f_closing c WHERE c.v_id = f.v_id), 0) AS last_km,
                    CASE WHEN EXISTS (
                        SELECT 1 FROM f_login_status ls2
                        WHERE ls2.id_emp = f.v_id AND ls2.login_status = '1'
                    ) THEN '1' ELSE '0' END AS login_status
                  FROM f_v_attach f
                  WHERE f.v_id NOT IN (
                      SELECT v_id FROM f_ontrip WHERE already_assign = '1'
                  )";
    } else {
        // Active vehicles only — mirrors vehicle_in_out.php:
        //   JOIN f_login_status + GROUP BY to get one row per vehicle (latest login)
        $query = "SELECT
                    f.id, f.v_id, f.v_cat, f.v_brand, f.v_model, f.v_no,
                    f.d_name, f.d_mobile, f.vacant_place,
                    COALESCE((SELECT MAX(CAST(c.closing_km AS UNSIGNED))
                               FROM f_closing c WHERE c.v_id = f.v_id), 0) AS last_km,
                    '1' AS login_status,
                    MAX(ls.login_time) AS login_time
                  FROM f_v_attach f
                  INNER JOIN f_login_status ls
                          ON ls.id_emp = f.v_id AND ls.login_status = '1'
                  WHERE f.v_id NOT IN (
                      SELECT v_id FROM f_ontrip WHERE already_assign = '1'
                  )";
    }

    if (!empty($v_cat)) {
        $query .= " AND f.v_cat = :v_cat";
    }

    if (!empty($v_model)) {
        $query .= " AND f.v_model = :v_model";
    }

    // GROUP BY prevents duplicate rows when a vehicle has multiple login records
    $query .= " GROUP BY f.id, f.v_id, f.v_cat, f.v_brand, f.v_model, f.v_no,
                          f.d_name, f.d_mobile, f.vacant_place";

    $query .= " ORDER BY f.v_cat, f.v_model, f.v_brand";

    $stmt = $db->prepare($query);
    if (!empty($v_cat)) {
        $stmt->bindParam(":v_cat", $v_cat);
    }
    if (!empty($v_model)) {
        $stmt->bindParam(":v_model", $v_model);
    }
    $stmt->execute();

    $vehicles = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $vehicles[] = $row;
    }

    echo json_encode($vehicles);
}
?>
