<?php
session_start();
$std=$_SESSION['Student_ID'];
require_once('../connection.php');
if ($_SERVER['REQUEST_METHOD']=='POST') {


    $Q="DELETE FROM select_career WHERE student_ID=?;";//deleting the previous searched history
    $stt=$connect->prepare($Q);
    $stt->bind_param('i',$std);
    $stt->execute();
    
    $sc=$_POST['careers'];
    $query= "INSERT IGNORE INTO select_career values (?,?);";
    $stat=$connect->prepare($query);
    foreach ($sc as $selected) {
        $q="SELECT career_id FROM career WHERE name=?;";
        $st=$connect->prepare($q);
        $st->bind_param('s',$selected);
        $st->execute();
        $res=$st->get_result();
        $row=$res->fetch_assoc();
        $career_id=$row['career_id'];

        $stat->bind_param('ii',$std,$career_id);
        $stat->execute();


    }


    
    header('location:roadmap.php');
}