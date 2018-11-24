<?php
include_once("dbclass.php");
$db=new db();
$user=$_POST['user_id'];
$menu=$_POST['user_menu'];
$hospital=$_POST['hospital'];
$db->qry("delete from user_menu where user=".$_POST['user_id']);
$qry='insert into user_menu(user,menu) values';
for($i=0;$i<sizeof($menu);$i++){
	if($menu[$i]['chk']=='true')
	 $q=$q."(".$user.",".$menu[$i]['menu_id']."),";	
}
$db->qry(rtrim($qry.$q,','));

$db->qry("delete from user_hospital where user_id=".$_POST['user_id']);
$q='';
$qry='insert into user_hospital(user_id,hospital_id) values';
for($i=0;$i<sizeof($hospital);$i++){
	if($hospital[$i]['chk']=='true')
	 $q=$q."(".$user.",".$hospital[$i]['hid']."),";	
}
//echo $qry.$q;
$db->qry(rtrim($qry.$q,','));


$db->qry("update user set level_id=".$_POST['level_id']." where uid=".$_POST['user_id']);
//echo rtrim($qry.$q,',');
echo "Menu updated successfully. Relogin to get menu updates.";
?>