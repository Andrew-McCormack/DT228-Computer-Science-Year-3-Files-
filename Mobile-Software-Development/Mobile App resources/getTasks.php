 <?php
  define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);

  $u = $_POST['userId'];

  // To protect MySQL injection 
  $u = stripslashes($u);

  // Escapes Quotes in Strings
  $u = $db_con->real_escape_string($u);

 $sql="SELECT * FROM events WHERE userId ='$u' OR otherUserId = '$u'";
 $res= mysqli_query($con,$sql);
 $result = array();
		
while($row = mysqli_fetch_array($res))
{
    array_push($result,
    array('eventId'=>$row[0],
    'userId'=>$row[1],
    'eventDetails'=>$row[2],
    'eventDate'=>$row[3],
    'eventUrgent'=>$row[4],
    'eventDuration'=>$row[5],
    'otherUserId'=>$row[6]
    ));
}
      
echo json_encode(array("result"=>$result));
 
mysqli_close($con);
 
?>
