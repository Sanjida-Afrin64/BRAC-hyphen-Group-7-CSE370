<?php
require_once('connection.php');
if ( isset($_POST["username"]) && isset($_POST["email"]) && isset($_POST["password"])) {
    
    $stname=$_POST["username"];
    $email=$_POST["email"];
    $pass=$_POST["password"];


    $query= "INSERT INTO student (StudentName,Password,Email) values (?,?,?);";
    $hashedpwd=password_hash($pass,PASSWORD_BCRYPT,['cost'=>10]);
    $statement=$connect->prepare($query); 
    $statement->bind_param('sss',$stname,$hashedpwd,$email);
    if ($statement->execute()){
        echo "Registered successfully";
        header('Location:studentdashboard.html');
       
    } else {
        echo "error occurred. Error:". $statement->error;
    }
    $statement->close();



}

$connect->close();

?>