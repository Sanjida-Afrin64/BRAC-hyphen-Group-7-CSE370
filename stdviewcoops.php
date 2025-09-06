
<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
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
$std = $_SESSION['Student_ID'];
require_once('../connection.php');

$q = "SELECT c1.title, c1.location, c1.pay_rate, a1.c_status
      FROM co_ops c1 
      JOIN applied_coops a1 ON c1.co_ops_id = a1.co_ops_id 
      WHERE a1.Student_ID = ?";

$stat = $connect->prepare($q);
$stat->bind_param('i', $std);
$stat->execute();
$res = $stat->get_result();
?>

<div style="display: flex; flex-direction: column; align-items: center;">
<?php while ($row = $res->fetch_assoc()) { ?>
    <div style="
        border: 1px solid #333; 
        padding: 15px; 
        margin: 10px 0; 
        border-radius: 8px; 
        box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
        max-width: 400px;
        width: 100%;
    ">
        <h3 style="margin: 0 0 10px 0;"><?= htmlspecialchars($row['title']) ?></h3>
        <p><strong>Location:</strong> <?= htmlspecialchars($row['location']) ?></p>
        <p><strong>Pay Rate:</strong> <?= htmlspecialchars($row['pay_rate']) ?></p>
        <p><strong>Status:</strong> <?= htmlspecialchars($row['c_status']) ?></p>
    </div>
<?php } ?>
</div>



         