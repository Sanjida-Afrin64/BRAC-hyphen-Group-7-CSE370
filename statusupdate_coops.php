<?php
require_once('../connection.php');
if (isset($_POST['co_ops_id']) && isset($_POST['Student_ID'])) {
    $action=$_POST['action'];
    $c_id=$_POST['co_ops_id'];
    $std_id=$_POST['Student_ID'];
    $q="UPDATE  applied_coops
    SET c_status=? WHERE co_ops_id=? AND Student_ID=?;";

    $stat=$connect->prepare($q);
    $stat->bind_param('sii',$action,$c_id,$std_id);
    $stat->execute();

  
   header('Location:adminportal.php');

}