 define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
  $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);

  $u = $_POST['userName'];

  // To protect MySQL injection 
  $u = stripslashes($u);

  // Escapes Quotes in Strings
  $u = $db_con->real_escape_string($u);

 $sql="SELECT * FROM users WHERE _id ='$u'";
 $res= mysqli_query($con,$sql);
 $result = array();
		
while($row = mysqli_fetch_array($res))
{
    array_push($result,
    array('userName'=>$row[1]
  ));
}
      
echo json_encode(array("result"=>$result));
 
mysqli_close($con);
 
?>
