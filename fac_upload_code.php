<?php
session_start();
if ($_SESSION['admin']=='yes') {
    include('../topbar_admin.php');
}else {
    include('../topbar_fac.php');
}
require_once('../connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title=$_POST["title"];
    $des=$_POST["description"];
    $skill=$_POST["skills"] ?? []; //if post does not exist then [] is used
    //the checklist is returned as an array of the checked boxes
    $other_string=$_POST["other_skills"] ?? '';
    if ($other_string!='') {
        $other_array = array_map('trim', explode(',', $other_string));
        $skill = array_merge($skill, $other_array); //merging two arrays
    }
   
    $fac_id=$_SESSION['faculty_id'];
    $query= "INSERT IGNORE INTO project (fac_id,title,description) values (?,?,?);";
    
    $statement=$connect->prepare($query); 
    $statement->bind_param('iss',$fac_id,$title,$des);
    if ($statement->execute()){
       $project_id=$connect->insert_id;//storing the last/recent auto generated id 
       
    } else {
        echo "error occurred. Error:". $statement->error;
    }
    foreach ($skill as $s) {
        $q="SELECT skill_code FROM skill where skill_name=?;";
        $stt=$connect->prepare($q); 
        $stt->bind_param('s',$s);
        $stt->execute();
        $res=$stt->get_result();

        if ($res->num_rows==0) {//if the skill doesn't exist in the skill table
            $q1="INSERT INTO skill (skill_name) values (?);";
            $st=$connect->prepare($q1); 
            $st->bind_param('s',$s);
            $st->execute();

        } else{
            $row=$res->fetch_assoc();
            $skillcode=$row['skill_code'];          
        }
        $query2="INSERT IGNORE INTO projectskill values (?,?);";
        $stt2=$connect->prepare($query2); 
        $stt2->bind_param('ii',$project_id,$skillcode);
        $stt2->execute(); 


    }
    echo "<br>";
    echo "<br>";
    echo "<br>";
    echo 'Uploaded project';
    $statement->close();

}
$connect->close();
?>

<?php

