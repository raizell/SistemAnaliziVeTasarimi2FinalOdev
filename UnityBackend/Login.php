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

$sql = "SELECT password, id FROM users WHERE username = '". $loginUser . " ' ";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    if($row["password"] == $loginPass){
        echo $row["id"];
        //Get kullanici verileri buraya
        
        //Get oyuncu bilgisi

        //Get envanter

        //Oyuncu bilgisi düzenle

        //Envanter güncelle
    }
    else{
        echo "Hatalı şifre.";
    }
  }
} else {
  echo "Kullanıcı bulunamadı.";
}
$conn->close();
?>

