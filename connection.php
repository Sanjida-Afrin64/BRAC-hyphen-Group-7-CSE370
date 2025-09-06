<?php
$servername='localhost';
$username='root';
$password='';
$dbname='brac_hyphen';
$connect=new mysqli ($servername,$username,$password,$dbname); 

if ($connect->connect_error) {

    die('Connection failed:'. $connect->connect_error);//connect_error will contain a string if connection fails

}
