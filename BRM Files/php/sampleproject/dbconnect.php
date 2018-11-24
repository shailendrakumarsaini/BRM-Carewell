<?php
 include_once "config.php";
class dbconnect
{
	
	 $con=mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
	public function __construct() 
	{
	  if($con)
	  {
		 // echo "connection established";
	  }   
	  else
	  {
		  if (mysqli_connect_errno($mysqli))
		  {
			//echo "Failed to connect to MySQL: " . mysqli_connect_error();
		}
	  }
	  
	}
	public function __destruct() {
	   mysqli_close($con);
	 }
	 return $con;
}
//$db=new dbconnect();
?>
