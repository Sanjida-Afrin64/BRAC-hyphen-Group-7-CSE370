<?php
session_start();
require_once("connection.php");

// Assuming student login sets this:
$student_id = $_SESSION['student_id'] ?? 1; // fallback for testing

$sql = "
SELECT 
    s.Name, 
    tp.CGPA, 
    GROUP_CONCAT(sk.Name SEPARATOR ', ') AS Skills
FROM Thesis_Partner tp
INNER JOIN Student s ON tp.STU_id = s.ID
INNER JOIN Skill sk ON tp.SKI_code = sk.Code
WHERE tp.STU_id <> $student_id
GROUP BY s.ID, tp.CGPA
";

$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Thesis Partner Finder</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 30px;
    background: #f7f9fb;
    color: #333;
}
h2 {
    text-align: center;
    margin-bottom: 20px;
}
.filter-box {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-bottom: 20px;
}
.filter-box input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    min-width: 200px;
    font-size: 14px;
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
    text-align: center;
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

<h2>Find a Thesis Partner</h2>

<div class="filter-box">
    <input type="text" id="cgpaFilter" placeholder="Enter minimum CGPA..." onkeyup="filterTable()">
    <input type="text" id="skillFilter" placeholder="Enter skill(s), comma separated..." onkeyup="filterTable()">
</div>

<table id="partnerTable">
    <tr><th>Name</th><th>CGPA</th><th>Skills</th></tr>
    <?php while($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?= htmlspecialchars($row['Name']) ?></td>
            <td><?= htmlspecialchars($row['CGPA']) ?></td>
            <td><?= htmlspecialchars($row['Skills']) ?></td>
        </tr>
    <?php } ?>
</table>

<script>
function filterTable(){
    let cgpaInput = document.getElementById("cgpaFilter").value.trim();
    let skillInput = document.getElementById("skillFilter").value.toLowerCase().trim();
    let rows = document.querySelectorAll("#partnerTable tr");

    let requiredSkills = skillInput ? skillInput.split(",").map(s => s.trim()).filter(s => s) : [];

    rows.forEach((row, i) => {
        if(i === 0) return;

        let cgpa = parseFloat(row.cells[1].innerText);
        let skills = row.cells[2].innerText.toLowerCase();

        let show = true;

        if(cgpaInput){
            let minCgpa = parseFloat(cgpaInput);
            if(isNaN(minCgpa) || cgpa < minCgpa){
                show = false;
            }
        }

        if(show && requiredSkills.length > 0){
            for(let req of requiredSkills){
                if(!skills.includes(req)){
                    show = false;
                    break;
                }
            }
        }

        if(!cgpaInput && requiredSkills.length === 0){
            show = true;
        }

        row.style.display = show ? "" : "none";
    });
}
</script>

</body>
</html>
