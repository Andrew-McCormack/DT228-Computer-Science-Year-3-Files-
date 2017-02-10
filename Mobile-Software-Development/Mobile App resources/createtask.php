<?php
    define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);

  $u = $_POST['userId'];
  $eDet = $_POST['eventDetails'];
  $eDat = $_POST['eventDate'];
  $eUrg = $_POST['eventUrgent'];
  $d = $_POST['eventDuration'];
  $oU = $_POST['otherUserId']; 

  // To protect MySQL injection 
  $eDet = stripslashes($eDet);
  $eDat = stripslashes($eDat);
  $eUrg = stripslashes($eUrg);
  $d = stripslashes($d);

  // Escapes Quotes in Strings
  $eDet = $db_con->real_escape_string($eDet);
  $eDat = $db_con->real_escape_string($eDat);
  $eUrg = $db_con->real_escape_string($eUrg);
  $d = $db_con->real_escape_string($d);

if (!empty($u) && !empty($eDet) && !empty($eDat) && !empty($d))
{
	if(!empty($oU))
	{
		if(($eUrg == 'y') or ($eUrg == 'Y'))
		{
			$sql="INSERT INTO `db_9e4279_tasks`.`events` (`eventId`, `userId`, `eventDetails`, `eventDate`, 				`eventUrgent`, 		`eventDuration`, `otherUserId`) VALUES (NULL, '$u', '$eDet', '$eDat', 					'$eUrg', '$d', '$oU')";
		}
		else
		{
			$sql="INSERT INTO `db_9e4279_tasks`.`events` (`eventId`, `userId`, `eventDetails`, `eventDate`, 				`eventUrgent`, 		`eventDuration`, `otherUserId`) VALUES (NULL, '$u', '$eDet', '$eDat', 					'n', '$d', '$oU')";
		}
  		if(mysqli_query($con,$sql))
  		{
    			echo 'success';
  		}
  		else
  		{
    			echo 'failure 1';
  		}
	}
	else
	{
		if(($eUrg == 'y') or ($eUrg == 'Y'))
		{
			$sql="INSERT INTO `db_9e4279_tasks`.`events` (`eventId`, `userId`, `eventDetails`, `eventDate`, 				`eventUrgent`, 		`eventDuration`, `otherUserId`) VALUES (NULL, '$u', '$eDet', '$eDat', 					'$eUrg', '$d', -1)";
		}
		else
		{
			$sql="INSERT INTO `db_9e4279_tasks`.`events` (`eventId`, `userId`, `eventDetails`, `eventDate`, 				`eventUrgent`, 		`eventDuration`, `otherUserId`) VALUES (NULL, '$u', '$eDet', '$eDat', 					'n', '$d', -1)";
		}
		
  		if(mysqli_query($con,$sql))
  		{
    			echo 'success';
  		}
  		else
  		{
    			echo 'failure 2';
  		}
	}
}

else
{
	echo 'failure 3';
}

  mysqli_close($con);
 
?>