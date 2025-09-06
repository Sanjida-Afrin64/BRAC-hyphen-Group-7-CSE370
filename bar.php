<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
    <a href="../studentdashboard.html" style="color:white; text-decoration:none;">Dashboard</a>
    <a href="../student_project/stcollabpage.html" style="color:white; text-decoration:none;">Upload My Skills</a>
    <a href="../student_project/show_projectoffers.php" style="color:white; text-decoration:none;">View Project Offers</a>
    <a href="../3buttons.html" style="color:white; text-decoration:none;">Add Course</a>
    <a href="../COOPS/stdviewcoops.php" style="color:white; text-decoration:none;">View Co-ops Offer</a>
    <a href="../COOPS/co-ops.html" style="color:white; text-decoration:none;">Find Co-ops</a>
    <a href="../career/form.html" style="color:white; text-decoration:none;">Career Roadmap</a>
    <a href="form.html" style="color:white; text-decoration:none;">Progress Tracker</a>
    <a href="../alumni/bhalumnis.html" style="color:white; text-decoration:none;">Alumni</a> "<br>"
</div>

<br>
<br>
<br>



<?php
session_start();
require_once('../connection.php');
$career_id=$_POST["career_id"];
$student_id=$_SESSION["Student_ID"];
$stmt_total = $connect->prepare("SELECT COUNT(*) AS total FROM st_progress WHERE student_ID=? ");
$stmt_total->bind_param('i', $student_id);
$stmt_total->execute();
$total = $stmt_total->get_result()->fetch_assoc()['total'];


$stmt_done = $connect->prepare("SELECT COUNT(*) AS done_count FROM st_progress WHERE student_ID=?  AND status='Done'");
$stmt_done->bind_param('i', $student_id);
$stmt_done->execute();
$done = $stmt_done->get_result()->fetch_assoc()['done_count'];


$percent=round(($done / $total) * 100);


$stmt_not_done = $connect->prepare("SELECT learning_modules FROM st_progress WHERE student_ID=?  AND status='Not done'");
$stmt_not_done->bind_param('i', $student_id);
$stmt_not_done->execute();
$res = $stmt_not_done->get_result();

echo "<div class='card'>";
echo "<ul>";
echo "<h2 style='margin-top:12px; color:#032D88;'> UNDONE </h2>";
while ($row=$res->fetch_assoc()) {
    echo "<li>" . htmlspecialchars($row['learning_modules']) . "</li>";
}
echo "</ul>";
echo "</div>";

echo "<br>";

?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Not Done Items & Progress</title>
<style>
body { font-family: Arial; margin: 20px; background: #f5f5f5; }
h2 { color: #032d88; }
.progress-container { width: 100%; background: #eee; border-radius: 8px; overflow: hidden; margin: 20px 0; }
.progress-bar { height: 25px; text-align: center; color: white; line-height: 25px; background: #032d88; }
.card { background: #fff; padding: 10px; margin-bottom: 10px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
</style>
</head>
<body>

<h2>Career Progress Bar</h2>

<div class="progress-container">
    <div class="progress-bar" style="width: <?= $percent ?>%">
        <?= $percent ?>%
    </div>
</div>
<p><?= $done ?> of <?= $total ?> items completed</p>

</div>

</body>
</html>


