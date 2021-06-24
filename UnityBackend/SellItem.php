<?php
require "ConnectionSettings.php";

//Kullanıcı tarafından gelen değişkenler
$ID = $_POST["ID"];
$userID = $_POST["userID"];
$itemID = $_POST["itemID"];

// Check connection
if ($conn->connect_error) {
    die("Bağlantı başarısız: " . $conn->connect_error);
}

$sql = "SELECT price FROM items WHERE ID = '". $itemID . " ' ";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    //Eşya fiyatını sakla
    $itemPrice = $result->fetch_assoc()["price"];

    //Eşya sil
    $sql2 = "DELETE FROM usersitems WHERE ID = '". $ID . " '";

    $result2 = $conn->query($sql2);
    if($result2){
        //Başarılı bir şekilde silinirse
        $sql3 ="UPDATE 'users' SET 'coins' = 'coins' + '" . $itemPrice. "' WHERE 'id' = '". $userID . " '";
        $conn->query($sql3);
    }
    else{
        echo "HATA: Eşya silinemedi.";
    }
} else {
    echo "0";
}
$conn->close();
?>