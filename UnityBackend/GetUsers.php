<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "unitybackend";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Bağlantı başarısız: " . $conn->connect_error);
}
echo "Bağlantı başarılı, kullanıcılar gösteriliyor. <br> <br> ";

$sql = "SELECT username, level FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Kullanıcı Adı: " . $row["username"]. " - Seviye: " . $row["level"]. "<br>";
  }
} else {
  echo "0 sonuç";
}
$conn->close();
?>

