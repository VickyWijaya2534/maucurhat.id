<?php
header("Content-Type: application/json");
include 'config.php';

$data = json_decode(file_get_contents("php://input"), true);
$response = [];

if (isset($data['judul']) && isset($data['isi'])) {
    $judul = $data['judul'];
    $isi = $data['isi'];

    // Query untuk menambahkan data ke database
    $sql = "INSERT INTO curhatans (judul, isi) VALUES ('$judul', '$isi')";
    if ($conn->query($sql) === TRUE) {
        $response['status'] = "success";
    } else {
        $response['status'] = "error";
        $response['message'] = $conn->error;
    }
}

// Query untuk mengambil semua data curhatan
$sql_get = "SELECT * FROM curhatans ORDER BY id DESC";
$result = $conn->query($sql_get);

$curhatan = [];
while ($row = $result->fetch_assoc()) {
    $curhatan[] = $row;
}

$response['curhatan'] = $curhatan;

echo json_encode($response);
$conn->close();
?>
