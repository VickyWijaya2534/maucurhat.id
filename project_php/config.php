<?php
$host = "localhost";
$user = "root"; // Sesuaikan dengan user database
$pass = ""; // Kosongkan jika tidak ada password
$dbname = "maucurhat_db";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
