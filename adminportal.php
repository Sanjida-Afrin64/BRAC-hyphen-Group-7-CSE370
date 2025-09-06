
<div style="width:100%; background-color:#001f4d; padding:15px 20px; position:fixed; top:0; left:0; z-index:1000; display:flex; align-items:center; gap:20px; font-size:18px; box-sizing:border-box;">
    <a href="../facdash_admin.html" style="color:white; text-decoration:none;">Dashboard</a>
    <a href="../fac_project/fac_upload_project.html" style="color:white; text-decoration:none;">Upload Project</a>
    <a href="../fac_project/facview.php" style="color:white; text-decoration:none;">View Project-Collab Requests</a>
    <a href="adminportal.php" style="color:white; text-decoration:none;">View Co-op Requests</a>
    <a href="../fac_project/admin_work.php" style="color:white; text-decoration:none;">CO-OPS Details</a>
</div>


<?php
session_start();

require_once('../connection.php');
$facid=$_SESSION['faculty_id'];
$q="SELECT * FROM co_ops c1
JOIN applied_coops a1 ON c1.co_ops_id=a1.co_ops_id
WHERE c1.approve_by=? AND a1.c_status='pending';";
$stat=$connect->prepare($q);
$stat->bind_param('i',$facid);
$stat->execute();
$res=$stat->get_result();
echo '<br>';
?>
<style>
table {
    border-collapse: collapse;
    width: 80%;
    margin: 30px auto; /* centers the table */
    background: #fff;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border-radius: 8px;
    text-align: left;
    font-size: 50px; /* makes all text bigger */
}

th {
    background: #1f2937;
    color: #fff;
    padding: 12px;
    font-size: 20px; /* header text slightly bigger */
}

td {
    padding: 10px 12px;
    border-bottom: 1px solid #ddd;
    font-size: 18px; /* cell text matches table font */
}

tr:hover {
    background: #f9fafb;
}

</style>

<table border="1" cellpadding="8" cellspacing="0">
    <thead>
        <tr>

          <th> Title </th>
          <th> Description </th>
          <th> Student_ID </th>
          <th> Status </th>
          <th> CV File </th>
          <th> Action </th>


        </tr>
    </thead>

    <tbody>
        <?php while ($row=$res->fetch_assoc()) {?>
        
            <tr> 
               <td> <?php echo $row['title'];?></td>
               <td> <?php echo $row['description'];?></td>
               <td> <?php echo $row['Student_ID'];?></td>
               <td> <?php echo $row['c_status'];?></td>
               <td> 
                   <a href="downloadlink.php?file_name=<?php echo $row['file_name'];?>">Download</a>
                </td>
                
                <td>
                   <form method="post" action="statusupdate_coops.php">
                       <input type="hidden" name="co_ops_id" value="<?php echo $row['co_ops_id']; ?>">
                       <input type="hidden" name="Student_ID" value="<?php echo $row['Student_ID']; ?>">


                       
                       <button type="submit" name="action" value="approved" style="background-color:green;color:white;padding:5px 10px;border:none;border-radius:4px;cursor:pointer;">
                           Approve
                       </button>
                       <button type="submit" name="action" value="rejected" style="background-color:red;color:white;padding:5px 10px;border:none;border-radius:4px;cursor:pointer;">
                           Reject
                       </button>
                    </form>
                </td>
        
            </tr>
          <?php } ?>
    </tbody>

</table>


