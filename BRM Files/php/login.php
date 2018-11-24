<?php
//echo $_GET['email'];
include_once("dbclass.php");
$db=new db();
function getRealIpAddr(){
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
    return $ip;
}

if($_GET['username'] !== null && $_GET['password'] !== null){

	$ip=getRealIpAddr();
    $res = $db->qry("select '".$ip."' as ip, name, email, status,mobile, level_id, level_name, username, uid from user,user_level where level_id=ul_id and status=1 and login_status='Y' and username='".$_GET['username']."' AND password = '" . $_GET['password'] . "'");
    echo json_encode($res);
}
if($_GET['user']!=null){
    $res=$db->qry("select * from user_menu,menu where menu.menu_id=user_menu.menu and user=".$_GET['user']." order by mainmenu_order,submenu_order");
    echo json_encode($res);
}
if($_GET['users']!=null){
	if($_GET['users']=="all")
    $res=$db->qry("select * from user,user_level where level_id=ul_id");
	else
	$res=$db->qry("select * from user,user_level where level_id=ul_id and uid=". $_GET['users']);
    echo json_encode($res);
}
if($_GET['levels']!=null){
	if($_GET['levels']=="all")
    $res=$db->qry("select * from user_level");
	else
	$res=$db->qry("select * from user_level where level_id=".$_GET['levels']);
    echo json_encode($res);
}
if($_GET['user_menu']!=null && $_GET['user_id']){
    $res=$db->qry("select * from menu left join user_menu on user_menu.menu=menu_id and user=".$_GET['user_id']." order by mainmenu_order,submenu_order ");
    echo json_encode($res);
}
if($_GET['status']!=null){
if($_GET['status']==1){ $isdel='N';}else{ $isdel='Y'; }
    $res=$db->qry("update user set status=".$_GET['status'].",is_deleted='$isdel' where uid=".$_GET['user_id']);
    echo "Status updated!";
}
if($_GET['delete_uid']!=null){
    $db->qry("update user set is_deleted='Y',status=0 where uid=".$_GET['delete_uid']);
	$db->qry("delete from user_menu where user=".$_GET['delete_uid']);
    echo "User deleted Successfully!";
}
if($_GET['branch']!=null && $_GET['user_id']){
    $res=$db->qry("select * from hospitals left join user_hospital on hid=hospital_id and user_id=".$_GET['user_id']." order by hospitals.hid");
    echo json_encode($res);
}
if($_POST['action']=='log_data' || $_POST['action']=='update_table'){
	//print_r($_POST);
	$logfile = "../log/edwise_".date('d_m_Y').".log";
	$fh = fopen($logfile, 'a') or die("can't open file");
	$stringData = json_encode($_POST,JSON_PRETTY_PRINT);
	fwrite($fh, $stringData.',');
	fclose($fh);
}
if($_GET['table']!=''){
	echo $q="update ".$_GET['table']." set ".$_GET['field']."='".$_GET['value']."' where sid=".$_GET['sid'];
	$db->qry($q);
}	
if($_GET['action']=='get_qualification'){
	 if($_GET['qdata']=='undefined'){ $qcond="IS NOT NULL"; }else{ $qcond="LIKE '%".$_GET['qdata']."%'"; }
	$res=$db->qry("select qualification from user where qualification ".$qcond." group by qualification limit 5");
    echo json_encode($res);
}	
if($_GET['action']=='get_specialization'){
	 if($_GET['sdata']=='undefined'){ $scond="IS NOT NULL"; }else{ $scond="LIKE '%".$_GET['sdata']."%'"; }
	$res=$db->qry("select spname from specialities where spname ".$scond." group by spname limit 5");
    echo json_encode($res);
}
if($_GET['action']=='get_doctors'){
	$res = $db->qry("SELECT u.uid, u.name, u.qualification FROM user AS u JOIN user_level AS ul ON u.level_id = ul.ul_id AND ul.level_name = 'Doctor' AND status =1");
    echo json_encode($res);
}	
if($_GET['action']=='get_surgeory_doctors'){
	$res=$db->qry("SELECT u.uid, u.name,u.qualification FROM user AS u JOIN user_level AS ul ON u.level_id = ul.ul_id AND ul.level_name = 'Doctor' AND u.specialization LIKE '%urge%'");
    echo json_encode($res);
}
if($_GET['action']=='get_anesthesia_doctors'){
	$res=$db->qry("SELECT u.uid, u.name, u.qualification FROM user AS u JOIN user_level AS ul ON u.level_id = ul.ul_id AND ul.level_name = 'Doctor' AND u.specialization LIKE '%nesthesia%'");
    echo json_encode($res);
}
if($_GET['action']=='get_pros') {
	$res = $db->qry("SELECT u.uid, u.name FROM user AS u JOIN user_level AS ul ON u.level_id = ul.ul_id AND ul.level_name = 'PRO' AND status =1");
    echo json_encode($res);
}
if($_GET['action'] === 'check_old_password') {
	extract($_POST);
	$check_password = $db->qry("SELECT name, email FROM user WHERE uid = '" . $user_id . "' AND password = '" . $password . "'");
	echo json_encode($check_password);
}
if($_GET['action'] === 'change_password') {
	extract($_POST);
	$change_password = $db->qry("UPDATE user SET password = '" . $password . "' WHERE uid = '" . $user_id . "'");
	echo json_encode($change_password);
}

?>


