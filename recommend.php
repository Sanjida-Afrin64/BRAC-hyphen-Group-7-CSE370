<?php
session_start();
require_once('connection.php');
if ($_SERVER['REQUEST_METHOD']=='POST') {

    $std_id=$_SESSION['Student_ID'];

    $query = "DELETE FROM add_course WHERE student_ID=?;";
    $stt = $connect->prepare($query);
    $stt->bind_param('i', $std_id); 
    $stt->execute();
    $stt->close();

    $action = $_POST['action'] ?? '';
    $courses = $_POST['courses'] ?? [];

    $query="INSERT IGNORE INTO add_course values (?,?);";
    $statement=$connect->prepare($query);

    foreach ($courses as $coursecode) {
        $coursecode = trim($coursecode);
        $statement->bind_param('is',$std_id,$coursecode);
        $statement->execute();
    }

    if ($action=='skills') {
        $q="SELECT a.courseID, c1.content FROM course c1 
            JOIN add_course a ON a.courseID=c1.courseID
            WHERE a.student_ID=?;" ;
        $stat=$connect->prepare($q);
        $stat->bind_param('i',$std_id);
        $stat->execute();
        $res=$stat->get_result();

        while ($row=$res->fetch_assoc()) {
            echo $row['courseID'];
            echo '<div class="info-box">'
                . htmlspecialchars($row['content']) .
            '</div>';
        } 
    } 
    elseif ($action=='recommend') {
        $q2="SELECT c.courseID, c.difficulty, c.EasyPercentage, c.AveragePercentage, c.HardPercentage
             FROM Course c JOIN add_course a ON a.courseID=c.courseID where a.student_ID=? ;";
        $sat=$connect->prepare($q2);
        $sat->bind_param('i',$std_id);
        $sat->execute();
        $result=$sat->get_result();

        while ($arr = $result->fetch_assoc()) {
            echo '<div class="info-box">
                    <h3 class="info-title">Recommendation</h3>
                    <p class="info-text">
                        The difficulty level of 
                        <span class="highlight">' . htmlspecialchars($arr['courseID']) . '</span> is 
                        <span class="highlight">' . htmlspecialchars($arr['difficulty']) . '</span>.<br>
                        
                        <span class="highlight">' . htmlspecialchars($arr['EasyPercentage']) . '%</span> of people found it 
                        <strong>easy</strong>, 
                        <span class="highlight">' . htmlspecialchars($arr['AveragePercentage']) . '%</span> found it 
                        <strong>medium</strong>, and 
                        <span class="highlight">' . htmlspecialchars($arr['HardPercentage']) . '%</span> found it 
                        <strong>difficult</strong>.
                    </p>
                  </div>';
        }
    }
    elseif ($action=='unlock') {
        $q="SELECT c1.courseID,c1.Unlock_Courses FROM Course c1 
            JOIN add_course a ON a.courseID=c1.courseID
            WHERE a.student_ID=?;" ;
        $st=$connect->prepare($q);
        $st->bind_param('i',$std_id);
        $st->execute();
        $res=$st->get_result();

        while ($row=$res->fetch_assoc()) {
            echo $row['courseID'];
            if ($row['Unlock_Courses']!=NULL) {
                echo '<div class="info-box">Unlock Courses: ' 
                    . htmlspecialchars($row['Unlock_Courses']) . 
                '</div>';
            } else {
                echo '<div class="info-box">Do not unlock any courses</div>';
            }
        }
    }
}
$connect->close();
?>


 <style>
.info-box {
    border: none;                 
    background: #eee8e8ff;           
    padding: 10px 16px;           
    margin: 8px 0;                
    font-family: 'Courier New', Courier, monospace;
    font-weight: 700;
    font-size: 14px;
    color: #0e075a;               
    user-select: none;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    box-shadow: none;  
}          
.info-title {
    color: #0e075a;
    margin-bottom: 10px;
}
.info-text {
    font-size: 16px;
    line-height: 1.6;
}
.highlight {
    color: #c61111ff;
    font-weight: bold;
}
