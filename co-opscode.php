


<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
    <a href="../studentdashboard.html" style="color:white; text-decoration:none;">Dashboard</a>
    <a href="../student_project/stcollabpage.html" style="color:white; text-decoration:none;">Upload My Skills</a>
    <a href="../student_project/show_projectoffers.php" style="color:white; text-decoration:none;">View Project Offers</a>
    <a href="../3buttons.html" style="color:white; text-decoration:none;">Add Course</a>
    <a href="stdviewcoops.php" style="color:white; text-decoration:none;">View Co-ops Offer</a>
    <a href="co-ops.html" style="color:white; text-decoration:none;">Find Co-ops</a>
    <a href="../career/form.html" style="color:white; text-decoration:none;">Career Roadmap</a>
    <a href="../progress/form.html" style="color:white; text-decoration:none;">Progress Tracker</a>
    <a href="../alumni/bhalumnis.html" style="color:white; text-decoration:none;">Alumni</a> "<br>"
</div>

<br>
<br>
<br>

<?php
session_start();
require_once('../connection.php');
if ($_SERVER['REQUEST_METHOD']=='POST') {
    $interest=$_POST['titles'] ?? [];
    $other=$_POST['other_titles'] ?? '';
    $std_id=$_SESSION['Student_ID'];
    if ($other!='') {
        $other_t=array_map('trim',explode(',',$other));//converting string to array
        $finterest=array_merge($interest,$other_t);

    }else {
        $finterest=$interest;
    }
    $location=$_POST['location'];
    $cg=$_POST['cgpa'];
    $credits=$_POST['min_credits'];

    //find matching
    $placeholder=implode(',',array_fill(0,count($finterest),'?'));//converts array to string
    //array fill [?,?,?] then converts to string '?,?,?'
    $q="SELECT * FROM co_ops WHERE location=? AND  cgpa<=? AND min_credit<=?
    AND title IN ($placeholder);"; //(?,?,?)

    $stat=$connect->prepare($q);
    $types='sdi'.str_repeat('s',count($finterest));//'sss'
    $stat->bind_param($types,$location,$cg,$credits,...$finterest);//finterest[0],finterest[1] binds every elements
    $stat->execute();
    $res=$stat->get_result();

    echo '<style>
    .coop-card {
        background-color: #000;
        color: #fff;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 10px;
        font-family: Arial, sans-serif;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
    }
    .coop-card h2 {
        margin-top: 0;
        color: #db0707ff;
    }
    .coop-card p {
        margin: 5px 0;
    }
    .apply-btn {
        background-color: #db0707ff;
        color: #fff;
        padding: 10px 20px;
        margin-top: 15px;
        border-radius: 5px;
        border: none;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease;
    }
    .apply-btn:hover {
        background(-color: #db0707ff;
    }
</style>';
    $req_count=0;

    if ($res->num_rows!=0) {
      while ($row = $res->fetch_assoc()) {

        $c_id=$row['co_ops_id'];
        $Q2= "SELECT * FROM applied_coops ap
        JOIN co_ops cc ON ap.co_ops_id=cc.co_ops_id 
        WHERE ap.co_ops_id=? AND ap.Student_ID=?;";
        $stmt = $connect->prepare($Q2);
        $stmt->bind_param('ii', $c_id,$std_id);
        $stmt->execute();
        $res1=$stmt->get_result();
        $row2=$res1->fetch_assoc();
        if ($res1->num_rows==0) {
             echo "<br>";

             echo '<div class="coop-card">';
             echo '<h2>' . htmlspecialchars($row['title']) . '</h2>';
             echo '<p><strong>Description:</strong> ' . htmlspecialchars($row['description']) . '</p>';
             echo '<p><strong>Required CGPA:</strong> ' . htmlspecialchars($row['cgpa']) . '</p>';
             echo '<p><strong>Location:</strong> ' . htmlspecialchars($row['location']) . '</p>';
             echo '<p><strong>Credits Earned:</strong> ' . htmlspecialchars($row['credits_earned']) . '</p>';
             echo '<p><strong>Work Hours per week:</strong> ' . htmlspecialchars($row['work_hours']) . '</p>';
             echo '<p><strong>Pay Rate:</strong> ' . htmlspecialchars($row['pay_rate']) . '</p>';
             echo '<p><strong>Start Date:</strong> ' . htmlspecialchars($row['start_date']) . '</p>';
             echo '<p><strong>End Date:</strong> ' . htmlspecialchars($row['end_date']) . '</p>';
             echo '<p><strong>Min Credit required:</strong> ' . htmlspecialchars($row['min_credit']) . '</p>';

   
             echo '<form method="post" action="fileupload.php" enctype="multipart/form-data">';
             echo '<input type="hidden" name="student_id" value="' . htmlspecialchars($std_id) . '">';
             echo '<input type="hidden" name="co_op_id" value="' . htmlspecialchars($row['co_ops_id']) . '">';
             echo '<label> Upload CV:</label> ';
             echo '<input type="file" name="CV" accept=".pdf,.doc,.docx" required> ';
             echo '<button type="submit" class="apply-btn">Apply Now</button>';
             echo '</form>';


             echo '</div>';
        } else {
            $req_count++;


      if ($res->num_rows==$req_count) {
?>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <div class="card text-center p-3 mx-auto mt-5" style="max-width:300px;">
      <?php echo 'Applied already to all the CO-OPS of your selected interest field!'; ?>
    </div>
<?php
      }
    

}
}
  
    }else {

?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <div class="card text-center p-3 mx-auto mt-5" style="max-width:300px;">
      <?php echo 'No Co-ops could find!'; ?>
    </div>
        



<?php  
}
}
?>


