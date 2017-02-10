    <?php
  define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);
     
  $u = $_POST['userName'];
  $fN = $_POST['firstName'];
  $lN = $_POST['lastName'];
  $p = $_POST['userPassWord'];
  $l = $_POST['userLocation'];
  $e = $_POST['userEmail']; 

  // To protect MySQL injection 
  $u = stripslashes($u);
  $fN = stripslashes($fN);
  $lN = stripslashes($lN);
  $p = stripslashes($p);
  $l = stripslashes($l);
  $e = stripslashes($e);

  // Escapes Quotes in Strings
  $u = $db_con->real_escape_string($u);
  $fN = $db_con->real_escape_string($fN);
  $lN = $db_con->real_escape_string($lN);
  $p = $db_con->real_escape_string($p);
  $l = $db_con->real_escape_string($l);
  $e = $db_con->real_escape_string($e);

if (!empty($u) && !empty($fN) && !empty($lN) && !empty($p) && !empty($l) && !empty($e))
{
  $sql="INSERT INTO `db_9e4279_tasks`.`users` (`_id`, `userName`, `firstName`, `lastName`, `userPassWord`,  `userLocation`,   `userEmail`) VALUES (NULL, '$u', '$fN ', '$lN', '$p', '$l', '$e')";
    
    if(mysqli_query($con,$sql))
    {
        echo 'success';
    }
    else
    {
      echo 'failure';
    }
}

else
{
  echo 'failure';
}
  mysqli_close($con);
 
?>