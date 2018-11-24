<?php
include_once("dbclass.php");
$db=new db();

if($_GET['fecilities'] === 'all') {
    //Retrieving the fecilities data
	$res=$db->qry("SELECT * FROM fecilities left join fecilities_group on fecilities .fcgid = fecilities_group.fcgid");
  	echo json_encode($res);
  }
  
  if($_GET['fecilities_group'] === 'all'){
	  //Retrieving the fecilities_group data
	  $res=$db->qry("select * from fecilities_group");
		echo json_encode($res);
  }

  if($_GET['fecilities'] === 'groups'){
	  
	  
	  $res=$db->qry("select * from fecilities_group");
		echo json_encode($res);
  }


  if($_GET['action'] === 'getActiveGroups'){
	  
	  
    $res = $db->qry("select * from fecilities_group WHERE fcg_status = 1");
      echo json_encode($res);
  }

  if($_GET['action'] === 'getActiveDrConsultationFecilities'){
	  
	  
    $res = $db->qry("SELECT * FROM fecilities left join fecilities_group on fecilities.fcgid = fecilities_group.fcgid WHERE fc_status = 1 AND fecilities.fcgid IN(1, 2)");
    echo json_encode($res);
  }

  if($_GET['fecilities_group'] === 'yes')
{
	$get_rec=$db->qry("select * from fecilities_group where  fcgid = ".$_GET['fcgid']);
	echo json_encode($get_rec);
}

  if($_GET['fecilities'] === 'yes')
{
	$get_rec=$db->qry("select * from fecilities,fecilities_group where  fecilities.fcgid=fecilities_group.fcgid and fcid=".$_GET['fc_id']);
	echo json_encode($get_rec);
}
if($_GET['act']=='add')
{
extract($_POST);

$getcode = $db->qry("select fcode from fecilities order by fcid desc limit 1");
if(gettype($getcode) === 'array')
{
$tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['fcode']) + 1;
} else {
 $tnumber = 1;
}	
$fcode = "FC" . $tnumber;

$add_rec=$db->qry("insert into fecilities (fcode,fcname,fcdesc,fcgid,tax) values ('$fcode','$fcname','$fcdesc','$fcgid','$tax')");
	echo json_encode($add_rec);
}
if($_GET['act'] === 'up')
{
    extract($_POST);
    //print_r($_POST);
    $update=$get_rec=$db->qry("update fecilities set 	fcode='$fcode',fcname='$fcname',	fcdesc='$fcdesc' , fcgid='$fcfcgid' , tax='$tax'  where fcid='$fcid'");
}
if($_GET['act'] === 'del'){
    $db->qry("delete from fecilities where fcid=".$_GET['fcid']);
     echo "Fecility deleted Successfully!";
}

if($_GET['act'] === 'updategrp')
{
extract($_POST);
//print_r($_POST);
  $upd=$get_rec=$db->qry("update fecilities_group set 	fcgname='$fcgname',	fcgdesc='$fcgdesc'  where fcgid='$fcgid'");
}
if($_GET['act']=='delgrp'){
    $db->qry("delete from fecilities_group where fcgid=".$_GET['fcg_id']);
     echo "Fecility group deleted Successfully!";
}
if($_GET['act'] === 'addgrp')
{
extract($_POST);
	$add_rec=$db->qry("insert into fecilities_group (fcgname,fcgdesc) values ('$fcgname','$fcgdesc')");
	echo json_encode($add_rec);
}
if($_GET['act'] === 'fcst'){
    $db->qry("update  fecilities set fc_status=".$_GET['fc_status']." where fcid=".$_GET['fcid']);
      echo "Status Change Successfully!";
}

 if($_GET['act'] === 'fcgst'){
    $db->qry("update  fecilities_group set fcg_status=".$_GET['status']." where fcgid=".$_GET['fcgid']);
      echo "Status Change Successfully!";
}
  ?>