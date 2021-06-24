<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "unitybackend";

//Kullanıcı tarafından gelen
$loginUser = $_POST["loginUser"];
$loginPass = $_POST["loginPass"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Bağlantı başarısız: " . $conn->connect_error);
}

$sql = "SELECT username FROM users WHERE username = '". $loginUser . " ' ";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    //Kullanici adi çoktan alındı
    echo "Kullanıcı adı zaten var.";

} else {
  echo "Kullanıcı oluşturuluyor...";
  //Kullanıcı adı ve şifreyi database e ekle
  $sql2 = "INSERT INTO users(username, password, level, coins)
  VALUES ('". $loginUser . "', '". $loginPass . "', 1, 0)";

if ($conn->query($sql2) === TRUE) {
    echo "Kullanıcı başarıyla oluşturuldu";
  } else {
    echo "Hata: " . $sql2 . "<br>" . $conn->error;
  }
}
$conn->close();
?>

