<?php
//echo $_GET['email'];
include_once("dbclass.php");
$db=new db();
function getRealIpAddr()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
    return $ip;
}

if($_GET['email']!=null){
	$ip=getRealIpAddr();
    $res=$db->qry("select '".$ip."' as ip,status,mobile,level_id,level_name,uid from user,user_level where level_id=ul_id and status=1 and email='".$_GET['email']."'");
    echo json_encode($res[0]);
}
if($_GET['user']!=null){
    $res=$db->qry("select * from user_menu,menu where menu.menu_id=user_menu.menu and user=".$_GET['user']." order by mainmenu_order,submenu_order");
    echo json_encode($res);
}

if($_GET['users']!=null){
	if($_GET['users']=="all")
    $res=$db->qry("select * from user,user_level where level_id=ul_id");
	else
	$res=$db->qry("select * from user,user_level where level_id=ul_id and uid=".$_GET['users']);
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
    $res=$db->qry("select * from menu left join user_menu  on user_menu.menu=menu_id and user=".$_GET['user_id']." order by mainmenu_order,submenu_order ");
    echo json_encode($res);
}

if($_GET['status']!=null){
    $res=$db->qry("update user set status=".$_GET['status']." where uid=".$_GET['user_id']);
    echo "Status updated!";
}
if($_GET['delete_uid']!=null){
    $db->qry("delete from user where uid=".$_GET['delete_uid']);
	$db->qry("delete from user_menu where user=".$_GET['delete_uid']);
    echo "User deleted Successfully!";
}

if($_GET['branch']!=null && $_GET['user_id']){
    $res=$db->qry("select * from branch left join user_branch on bid=branch_id and user_id=".$_GET['user_id']." ");
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


?>


