<?php
session_start();
require_once('connection.php');
if (isset($_POST["email"])  && isset($_POST["password"])) {
          
        $pass=$_POST["password"];
        $email=$_POST["email"];    
   
        $query="select * from student where Email=?;";
    
        $statement=$connect->prepare($query);
        $statement->bind_param('s',$email);
        $statement->execute();
        $res=$statement->get_result();
        if ($res->num_rows!=0){
           $res_array=$res->fetch_assoc();
           $hashed_pw=$res_array['Password'];

            if (password_verify($pass, $hashed_pw)) {
              
              session_regenerate_id(true);
              $_SESSION['Student_ID']= $res_array['student_ID'];
              header('Location: studentdashboard.html');

            } else {
                echo 'Wrong credentials. Please re-enter.';
            } 
        } else {
           echo "No userID could find."; 
        }     

}
$statement->close();  
    


$connect->close();
?>