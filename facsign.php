<?php
session_start();
require_once('connection.php');
if ( isset($_POST["name"]) && isset($_POST["email"]) && isset($_POST["password"])) {
    
    $name=$_POST["name"];
    $email=$_POST["email"];
    $pass=$_POST["password"];
    $initial=$_POST["initial"];

    $query= "INSERT INTO faculty (fac_initial,name,email,password) values (?,?,?,?);";
    $hashedpwd=password_hash($pass,PASSWORD_BCRYPT,['cost'=>10]);
    $statement=$connect->prepare($query); 
    $statement->bind_param('ssss',$initial,$name,$email,$hashedpwd);
    if ($statement->execute()){
        echo "Registered successfully";
       
    } else {
        echo "error occurred. Error:". $statement->error;
    }
    $statement->close();

}
$connect->close();
?>