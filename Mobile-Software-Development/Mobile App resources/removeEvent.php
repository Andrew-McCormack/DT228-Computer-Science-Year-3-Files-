 <?php
 define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);

  $u = $_POST['eventId'];

  // To protect MySQL injection 
  $u = stripslashes($u);

  // Escapes Quotes in Strings
  $u = $db_con->real_escape_string($u);

 $sql="DELETE FROM `db_9e4279_tasks`.`events` WHERE `events`.`eventId` = '$u'";
  if(mysqli_query($con,$sql))
    {
        echo 'success';
    }
    else
    {
      echo 'failure';
    }

  mysqli_close($con);
 
?>