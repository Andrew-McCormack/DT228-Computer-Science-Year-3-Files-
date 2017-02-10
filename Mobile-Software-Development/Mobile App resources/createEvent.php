    <?php
  define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
     
  $u = $_POST['userId'];
  $eDet = $_POST['eventDetails'];
  $eDat = $_POST['eventDate'];
  $eUrg = $_POST['eventUrgent'];
  $d = $_POST['eventDuration'];
  $oU = $_POST['otherUserId']; 

  // To protect MySQL injection 
  $u = stripslashes($u);
  $eDet = stripslashes($fN);
  $eDat = stripslashes($lN);
  $eUrg = stripslashes($p);
  $d = stripslashes($l);
  $oU = stripslashes($e);

if (!empty($u) && !empty($eDet) && !empty($eDat) && !empty($d))
{
	$sql="INSERT INTO `db_9e3112_tasks`.`events` (`eventId`, `userId`, `eventDetails`, `eventDate`, `eventUrgent`, 	`eventDuration`, `otherUserId`) VALUES (NULL, '$u', '$eDet', 'eDat', 'eUrg', '$d', '$oU')";
		
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


