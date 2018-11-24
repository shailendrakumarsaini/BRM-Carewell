<?php
include_once("dbclass.php");
$db=new db();
$db->qry("delete from user_menu where user=".$_POST['user_id']);
$user=$_POST['user'];
/* print_r($user);
print_r($_POST); */

 

$getcode = $db->qry("select code,level_code from user,user_level where user.level_id=user_level.ul_id and level_id=".$user['level']." order by uid desc limit 1");

if(gettype($getcode) === 'array'){
$tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['code'])+1;
}else{
$getcode = $db->qry("select level_code from user_level where ul_id=".$user['level']."");
$tnumber=1;
}	

$ucode = $getcode[0]['level_code']."".$tnumber;

$str = $user['doj'];
$pat = "/(?:Sun|Mon|Tue|Wed|Thu|Fri|Sat) (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (?:0?[1-9]|[1-2][0-9]|3[0-1]) [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2} GMT\\+[0-9]{4}/";
$dojoin = preg_match($pat, $str, $mat) ? date("Y-m-d", strtotime($mat[0])) : "";

if($user['outer_staff']==true){ 
	$outer='Y'; 
}else{
	$outer='N'; 
}
if($user['salary_emp']==true){
	$salary='Y';	
}else{
	$salary='N';
}
if($user['login_status']==true){
	$login='Y';
}else{
	$login='N';
}


$qry="insert into user(code,name,email,mobile,address,city,level_id,status,qualification,specialization,note,whatsapp,doj,outer_staff,password,username,login_status) values('".$ucode."','".$user['name']."','".$user['email']."','".$_POST['mobile']."','".$user['street']."','".$user['city']."',".$user['level'].",1,'".$_POST['qualification']."','".$_POST['specialization']."','".$user['note']."','".$_POST['whatsapp']."','" . $dojoin . "','" . $outer . "','" . $user['password'] . "','" . $user['username'] . "','" . $login . "' )";

 $result=$db->qry($qry);
 print_r($result);
//echo $result;
 
echo "User Created Successfully! Now you can assign menu to the same.";

 /* $userid = $db->id();

        //upload image
        $target_dir = "../uploads/users/";
		
        $actualFileName = basename($_FILES["refPhoto"]["name"]);
        $explodeFileName = explode(".", $actualFileName);
        $extensionOfFile = end($explodeFileName);
		$storedFileName = $userid . '.' . $extensionOfFile;
        $target_file = $target_dir . $storedFileName;
	
        if (move_uploaded_file($_FILES["refPhoto"]["tmp_name"], $target_file)) {
			echo "The file ". basename( $_FILES["refPhoto"]["name"]). " has been uploaded.";
		} else {
			echo "Sorry, there was an error uploading your file.";
		}
        
        echo $updateReferral = $db->qry("UPDATE user SET image = '" . $storedFileName . "' WHERE uid = " . $userid); 
		 echo json_encode($result);  */
?>