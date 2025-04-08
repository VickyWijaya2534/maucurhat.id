<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");
include 'config.php';

$sql = "SELECT * FROM curhatans ORDER BY created_at DESC";
$result = $conn->query($sql);

$curhatan = [];
while ($row = $result->fetch_assoc()) {
    $curhatan[] = $row;
}

echo json_encode($curhatan);
?>
