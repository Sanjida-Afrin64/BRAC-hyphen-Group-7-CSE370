<?php
include('../topbar_admin.php');
echo "<br>";
echo "<br>";
echo "<br>";
require_once('../connection.php');
session_start();
$f_id = $_SESSION['faculty_id'];
$sql = "SELECT * FROM co_ops WHERE approve_by=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param('i', $f_id);
$stmt->execute();
$res = $stmt->get_result();


echo '<style>
.coop-card {
    background: #dceaf2ff; /* light sky blue */
    color: #111;
    padding: 25px 30px;
    margin: 20px auto;
    width: 90%; /* wider card */
    max-width: 900px;
    border-radius: 12px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 20px;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    transition: transform 0.3s, box-shadow 0.3s;
}
.coop-card:hover { transform: translateY(-5px); box-shadow: 0 12px 28px rgba(0,0,0,0.25);}
.coop-card h2 {
    width: 100%;
    margin-top:0;
    color: #064e8a;
    font-size: 26px;
    font-weight:700;
}
.coop-card p {
    flex: 1 1 45%; /* two-column layout */
    margin:6px 0;
    line-height:1.5;
    font-size:16px;
    color:#0b3d91;
}
.apply-btn {
    display:inline-block;
    background:#1e90ff;
    color:#fff;
    padding:12px 25px;
    margin-top:15px;
    border-radius:8px;
    border:none;
    font-weight:600;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
    text-decoration:none;
}
.apply-btn:hover { background:#0b60b5; transform:translateY(-2px);}
.coop-card strong { color:#0b3d91;}
</style>';

while ($row = $res->fetch_assoc()) {
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
    echo '</div>';
}
?>




