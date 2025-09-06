<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
    <a href="../studentdashboard.html" style="color:white; text-decoration:none;">Dashboard</a>
    <a href="../student_project/stcollabpage.html" style="color:white; text-decoration:none;">Upload My Skills</a>
    <a href="../student_project/show_projectoffers.php" style="color:white; text-decoration:none;">View Project Offers</a>
    <a href="../3buttons.html" style="color:white; text-decoration:none;">Add Course</a>
    <a href="../COOPS/stdviewcoops.php" style="color:white; text-decoration:none;">View Co-ops Offer</a>
    <a href="../COOPS/co-ops.html" style="color:white; text-decoration:none;">Find Co-ops</a>
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

$student_id = $_SESSION['Student_ID'];

function progress($connect, $cid, $sid, $items) {
    $type = array_map('trim', explode(',', $items));
    
    foreach ($type as $each_item) {
        $Q = "INSERT IGNORE INTO st_progress VALUES (?,?,?)";
        $stmt = $connect->prepare($Q);
        $statusDefault = 'Not done';
        $stmt->bind_param('iss', $sid,$each_item, $statusDefault);
        $stmt->execute();

        echo "<div style='display:flex; flex-direction:column; align-items:center; justify-content:center; gap:15px; margin:40px; font-family:Arial, sans-serif;'>
          <label style='display:flex; align-items:center; gap:12px; padding:14px 20px; background:#d9e2ec; color:#1f2a37; border-radius:12px; box-shadow:0 3px 8px rgba(0,0,0,0.15); width:300px; cursor:pointer; transition:0.3s;'>
            <input type='checkbox' class='tracker' data-id='$cid' value='" . htmlspecialchars($each_item, ENT_QUOTES) . "' style='transform:scale(1.3); margin:0; accent-color:#1f4e79;'>
            <span style='font-size:16px; font-weight:500;'>" . htmlspecialchars($each_item) . "</span>
          </label>
        </div>";

}
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sc = $_POST['career'];
    $Q = "SELECT * FROM career WHERE name='$sc'";
    $res = mysqli_query($connect, $Q);
    $row = mysqli_fetch_assoc($res);
    $cid = $row['career_id'];
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Career Progress</title>
</head>
<body>

<h3><?= htmlspecialchars($row['name']) ?></h3>

<?php
progress($connect, $cid, $student_id, $row['beginner_skills']);
progress($connect, $cid, $student_id, $row['intermediate_skills']);
progress($connect, $cid, $student_id, $row['advanced_skills']);
progress($connect, $cid, $student_id, $row['electives']);
progress($connect, $cid, $student_id, $row['online']);
progress($connect, $cid, $student_id, $row['certification']);
?>

<script>
document.querySelectorAll("input.tracker").forEach(cb => {
    cb.addEventListener('change', function() {
        const careerId = this.dataset.id; 
        const itemName = this.value;
        let status;
        if (this.checked) {
            status = "Done";
        } else {
            status = "Not done";//user unchecked the  box
        }

        fetch('save.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `career_id=${encodeURIComponent(careerId)}&item_name=${encodeURIComponent(itemName)}&status=${encodeURIComponent(status)}`
        })
      
    });
});
</script>

</body>
</html>

<?php
echo "<br>";
?>

<form action="bar.php" method="post" style="display:inline;">
    <input type="hidden" name="career_id" value="<?php echo $cid; ?>">
    <button type="submit" class="btn btn-addcourse" style="padding:10px 20px; background-color:#032d88; color:white; border:none; border-radius:6px; cursor:pointer;">
        See Progress Bar
    </button>
</form>

