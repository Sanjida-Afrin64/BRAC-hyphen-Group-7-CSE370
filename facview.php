


<?php

session_start();
if ($_SESSION['admin']=='yes') {
    include('../topbar_admin.php');
}else {
    include('../topbar_fac.php');
}
require_once('../connection.php');
$facid = $_SESSION['faculty_id'];
$Q = "SELECT rq.student_ID, p.project_id, p.title, p.description 
      FROM request rq
      JOIN project p ON p.project_id = rq.project_id
      WHERE p.fac_id = ? AND rq.status = 'pending'";

$statement = $connect->prepare($Q);
$statement->bind_param('i', $facid);
$statement->execute();
$res = $statement->get_result();
echo '<br>';
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Requests</title>
<style>
table {
    border-collapse: collapse;
    width: 80%;
    margin: 30px auto;
    background: #fff;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border-radius: 8px;
    text-align: left;
    font-size: 18px;
}

th {
    background: #1f2937;
    color: #fff;
    padding: 12px;
    font-size: 20px;
}

td {
    padding: 10px 12px;
    border-bottom: 1px solid #ddd;
    font-size: 18px;
}

tr:hover {
    background: #f9fafb;
}

button.approve {
    background-color: #28a745; /* green */
    color: #fff;
    border: none;
    padding: 8px 14px;
    border-radius: 6px;
    cursor: pointer;
    margin-right: 6px;
    font-size: 16px;
}

button.reject {
    background-color: #dc3545; /* red */
    color: #fff;
    border: none;
    padding: 8px 14px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
}

button.approve:hover {
    background-color: #218838;
}

button.reject:hover {
    background-color: #c82333;
}
</style>
</head>
<body>

<table>
    <tr>
        <th>Student ID</th>
        <th>Project Title</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
<?php
if ($res->num_rows != 0) {
    while ($row = $res->fetch_assoc()) {
        echo '<tr>';
        echo '<td>' . htmlspecialchars($row['student_ID']) . '</td>';
        echo '<td>' . htmlspecialchars($row['title']) . '</td>';
        echo '<td>' . htmlspecialchars($row['description']) . '</td>';
        echo '<td>
            <form action="request_handle.php" method="POST" style="display:inline;">
                <input type="hidden" name="student_id" value="' . htmlspecialchars($row['student_ID']) . '">
                <input type="hidden" name="project_id" value="' . htmlspecialchars($row['project_id']) . '">
                <button type="submit" name="action" value="Accepted" class="approve">Approve</button>
                <button type="submit" name="action" value="Rejected" class="reject">Reject</button>
            </form>
        </td>';
        echo '</tr>';
    }
} else {
    echo '<tr><td colspan="4" style="text-align:center;">No requests found.</td></tr>';
}
?>
</table>

</body>
</html>






