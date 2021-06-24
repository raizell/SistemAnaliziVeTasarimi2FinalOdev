<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "unitybackend";

//Kullanıcı tarafından gelen
//$loginUser = $_POST["loginUser"];
//$loginPass = $_POST["loginPass"];
$itemID = $_POST["itemID"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Bağlantı başarısız: " . $conn->connect_error);
}

$sql = "SELECT name, description, price FROM items WHERE ID = '". $itemID . " ' ";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
      $rows = array();
      while($row = $result->fetch_assoc()){
          $rows[] = $row;
      }
      // dizi yaratıldıktan sonra
      echo json_encode($rows);
  } else {
    echo "0 sonuç";
  }

$conn->close();
?>

