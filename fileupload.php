<?php
require_once('../connection.php');
$std_id=$_POST['student_id'] ??'';
$co_id=$_POST['co_op_id']??'';

if ($std_id=='' or $co_id=='') {
    die('Missing info');
}

if (!isset($_FILES['CV'])) {//if file is empty
    die('upload your resume!');
}

$allowed=['application/pdf','application/msword',"application/vnd.openxmlformats-officedocument.wordprocessingml.document"];

//pdf,word, Word docx MIME types which is the standard file name to identify 
if (!in_array($_FILES['CV']['type'],$allowed)){
    die('Invalid data type');

}

$directory='C:/New_xampp/htdocs/Project/Resume/';
$file_name=$_FILES['CV']['name'];
$file_path=$directory.$file_name;
$temp_path=$_FILES['CV']['tmp_name'];
move_uploaded_file($temp_path,$file_path);//moves from temporary directory to permanent

$q='INSERT IGNORE INTO applied_coops (co_ops_id,Student_ID,file_name)
values(?,?,?);';
$stat=$connect->prepare($q);
$stat->bind_param('iis',$co_id,$std_id,$file_name);
$stat->execute();
echo "<h3> Application submitted successfully!</h3>";

?>


