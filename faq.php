<?php
require_once("connection.php");

$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : "";

$sql = "SELECT * FROM FAQ 
        WHERE Question LIKE '%$keyword%' 
           OR Answer LIKE '%$keyword%' 
           OR Keywords LIKE '%$keyword%'";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FAQs</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 30px;
    background: #f9fafa;
    color: #333;
}
h2 {
    text-align: center;
    margin-bottom: 20px;
}
.search-box {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}
.search-box input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px 0 0 8px;
    min-width: 300px;
}
.search-box button {
    padding: 10px 15px;
    border: none;
    background: #0077cc;
    color: white;
    border-radius: 0 8px 8px 0;
    cursor: pointer;
}
.search-box button:hover {
    background: #005fa3;
}
table {
    width: 80%;
    margin: auto;
    border-collapse: collapse;
    background: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}
table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}
table th {
    background: #0077cc;
    color: white;
}
table tr:nth-child(even) {
    background: #f2f6fa;
}
</style>
</head>
<body>

<h2>FAQs for New Students</h2>

<form method="get" class="search-box">
    <input type="text" name="keyword" placeholder="Search FAQs..." value="<?= htmlspecialchars($keyword) ?>">
    <button type="submit">Search</button>
</form>

<table>
    <tr><th>Question</th><th>Answer</th></tr>
    <?php if($result->num_rows > 0): ?>
        <?php while($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?= htmlspecialchars($row['Question']) ?></td>
                <td><?= htmlspecialchars($row['Answer']) ?></td>
            </tr>
        <?php } ?>
    <?php else: ?>
        <tr><td colspan="2">No FAQs found.</td></tr>
    <?php endif; ?>
</table>

</body>
</html>
