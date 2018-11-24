<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



</head>

<body>
    <br><br>
    <div class=" col-md-6">
        <form method="get">
            <label>Main Menu</label>
            <input name="mainmenu">
            <label>Sub Menu</label>
            <input name="submenu">
            <input type="hidden" name="action" value="create">
            <input type="submit" value="Create">
        </form>
    </div>

</body>

</html>
<?php
if($_GET[action]=='create'){
    include "../php/dbclass.php";
    $db=new db();
    $mm=$_GET['mainmenu'];
    $sm= $_GET['submenu'];
    $lsm=preg_replace('/\s+/', '', strtolower($sm));
    
    $maxmenu=($db->qry("select max(mainmenu_order) as mo from menu"))[0]['mo'];
    $res=$db->qry("select *, IFNULL(submenu_order,'0') as sm_order from menu where lcase(mainmenu)='".strtolower($_GET['mainmenu'])."' order by submenu_order desc limit 1");
    //print_r($res);
    extract($res[0]);
    $mainmenu_order=is_null($mainmenu_order)?($maxmenu+1):$mainmenu_order;
    $sm_order=is_null($sm_order)?1:$sm_order+1;


    $mqry="insert into menu(mainmenu,mainmenu_order,mainmenu_icon,
                         submenu,submenu_order,submenu_icon,href,
                         tag,url,controller,min_level,side_menu) values('$mm',$mainmenu_order,'fa fa-th-list',
                         '$sm',$sm_order,'fa fa-angle-right','#$lsm',
                         '/$lsm','".$lsm.".html','".$lsm."_ctrl',8,0)";

    $db->qry($mqry);

    $blank_html = fopen("../html/blank.html", "r") or die("Unable to open file!");
    touch("../html/".$lsm.".html");
    chmod("../html/".$lsm.".html", 0777);
    $new_html = fopen("../html/".$lsm.".html", "w") or die("Unable to open file!");
    
    while(!feof($blank_html)) {
        
        fwrite($new_html,str_replace('blank_ctrl',$lsm.'_ctrl',str_replace("Blank",$sm,fgets($blank_html))));

    }
    echo "html Created..<br/>";
    fclose($blank_html);
    fclose($new_html);


    $blank_js = fopen("../controller/blank_ctrl.js", "r") or die("Unable to open file!");
     touch("../controller/".$lsm."_ctrl.js");
    chmod("../controller/".$lsm."_ctrl.js", 0777);
    $new_js = fopen("../controller/".$lsm."_ctrl.js", "w") or die("Unable to open file!");
    
    while(!feof($blank_js)) {
        
        fwrite($new_js,str_replace('blank_ctrl',$lsm.'_ctrl',fgets($blank_js)));

    }
    echo "JS Created..<br/>";
    fclose($blank_js);
    fclose($new_js);
    echo "Please goto Users Page Enable permission for this user by clicking on user name! After logout and relogin again";
    

 }


?>
