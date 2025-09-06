<?php
session_start();
require_once('../connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $career_id = $_POST['career_id'];
    $item_name = $_POST['item_name'];
    $status = $_POST['status'];
    $student_id = $_SESSION['Student_ID'];
    $sql = "UPDATE st_progress 
            SET status = ? 
            WHERE student_ID = ? AND learning_modules = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param('sis', $status, $student_id, $item_name);
    $stmt->execute();
  

}