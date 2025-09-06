
<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
    <a href="../studentdashboard.html" style="color:white; text-decoration:none;">Dashboard</a>
    <a href="../student_project/stcollabpage.html" style="color:white; text-decoration:none;">Upload My Skills</a>
    <a href="../student_project/show_projectoffers.php" style="color:white; text-decoration:none;">View Project Offers</a>
    <a href="../3buttons.html" style="color:white; text-decoration:none;">Add Course</a>
    <a href="../COOPS/stdviewcoops.php" style="color:white; text-decoration:none;">View Co-ops Offer</a>
    <a href="../COOPS/co-ops.html" style="color:white; text-decoration:none;">Find Co-ops</a>
    <a href="form.html" style="color:white; text-decoration:none;">Career Roadmap</a>
    <a href="../progress/form.html" style="color:white; text-decoration:none;">Progress Tracker</a>
    <a href="../alumni/bhalumnis.html" style="color:white; text-decoration:none;">Alumni</a> "<br>"
</div>



<br>
<br>
<br>


<?php
session_start();
require_once('../connection.php');
$std = $_SESSION['Student_ID'];

$q = "SELECT *
      FROM career c 
      JOIN select_career sc ON sc.career_id = c.career_id
      WHERE sc.student_ID = ?;";

$stt = $connect->prepare($q);
$stt->bind_param('i', $std);
$stt->execute();
$res = $stt->get_result();

function toList($title, $items) {
   
    $list = array_map('trim', explode(',', $items));
    echo "<h4 style='margin-top:12px; color:#032D88;'>$title</h4>";
    echo "<ul>";
    foreach ($list as $item) {
        if(!empty($item)){
            echo "<li> • $item</li>";
        }
    }
    echo "</ul>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Career Progress</title>
<style>
    
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f0f2f5;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
}
.container {
    width: 90%;
    max-width: 900px;
}
.card {
    background: #fff;
    border-radius: 12px;
    padding: 25px;
    margin-bottom: 20px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.08);
    transition: transform 0.2s;
}
.card:hover {
    transform: translateY(-5px);
}
h3 {
    text-align: center;
    color: #032D88;
    margin-bottom: 15px;
}
h4 {
    margin-bottom: 6px;
}
ul {
    list-style: none;
    padding-left: 15px;
}
li {
    margin: 4px 0;
    font-size: 15px;
    color: #333;
}
</style>
</head>
<body>
<div class="container">
<?php
while ($row = $res->fetch_assoc()) {
    echo "<br>";
    echo "<br>";
    echo "<div class='card'>";
    echo "<h3>{$row['name']}</h3>";

    toList("Beginner Skills", $row['beginner_skills']);
    toList("Intermediate Skills", $row['intermediate_skills']);
    toList("Advanced Skills", $row['advanced_skills']);
    toList("Electives in Brac", $row['electives']);
    toList("Online Courses", $row['online']);
    toList("Online Certification", $row['certification']);

    echo "</div>";
}
?>
</div>
</body>
</html>







    

    


