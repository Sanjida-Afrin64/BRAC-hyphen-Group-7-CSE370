
<?php
session_start();
require_once('connection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $initial = trim($_POST["initial"] ?? '');
    $pass = trim($_POST["password"] ?? '');


    if ($initial && $pass) {
        $query = "SELECT * FROM faculty WHERE fac_initial = ?";
        $statement = $connect->prepare($query);
        if (!$statement) {
            die('Prepare failed: ' . $connect->error);
        }
        $statement->bind_param('s', $initial);
        $statement->execute();
        $res = $statement->get_result();

        if ($res->num_rows > 0) {
            $res_array = $res->fetch_assoc();

            $hashed_pw = $res_array['password'];
            $facid=$res_array['fac_id'];
            if (password_verify($pass, $hashed_pw)) {
                
                session_regenerate_id(true);
                $_SESSION['faculty_id'] = $res_array['fac_id'];
                $q="SELECT * FROM admin where fac_id=?;";
                $stat=$connect->prepare($q);
                $stat->bind_param('i',$facid);
                $stat->execute();
                $result=$stat->get_result();
                if ($result->num_rows==0) {
                    $_SESSION['admin']='no';
                    header('Location: facdashboard.html');
                    exit();
                } else {
                     $_SESSION['admin']='yes';
                    header('Location:facdash_admin.html');
                    exit();

                }
            } else {
                $error = 'Wrong credentials. Please re-enter.';
            }
        } else {
            $error = "No user found with that ID.";
        }
        $statement->close();
    } else {
        echo "Please enter both initial and password.";
    }
    $connect->close();
}
?>

