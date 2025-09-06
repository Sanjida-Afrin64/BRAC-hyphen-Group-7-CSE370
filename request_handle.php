<?php
require_once('../connection.php');

$std_id =$_POST['student_id'];
$p_id=$_POST['project_id'];
$action=$_POST['action'];
$sql = "UPDATE request SET status = ? WHERE student_ID = ? AND project_id=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param('sii', $action, $std_id,$p_id);

if ($stmt->execute()) {
    header('Location:facview.php');
}
?>