    <?php
  define('HOST','MYSQL5013.HostBuddy.com');
  define('USER','9e4279_tasks');
  define('PASS','Database1234');
  define('DB','db_9e4279_tasks');
    $con = mysqli_connect(HOST,USER,PASS,DB);
  $db_con = new mysqli(HOST,USER,PASS,DB);
     
  $u = $_POST['userName'];
  $p = $_POST['password']; 

  // To protect MySQL injection 
  $u = stripslashes($u);
  $p = stripslashes($p);
 
  // Escapes Quotes in Strings
  $u = $db_con->real_escape_string($u);
  $p = $db_con->real_escape_string($p);

 $sql="SELECT * FROM users WHERE userName ='$u' AND userPassWord = '$p'";
 $res= mysqli_query($con,$sql);
 $result = array();
    
while($row = mysqli_fetch_array($res))
{
    array_push($result,
    array('_id'=>$row[0],
    'userName'=>$row[1],
    'firstName'=>$row[2],
    'lastName'=>$row[3],
    'userPassWord'=>$row[4],
    'userLocation'=>$row[5],
    'userEmail'=>$row[6]
  ));
}
      
echo json_encode(array("result"=>$result));
 
mysqli_close($con);
 
?>

