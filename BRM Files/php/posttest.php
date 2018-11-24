<?php
	header("Access-Control-Allow-Origin: *");
    	//header("Access-Control-Allow-Credentials: true");
    	//header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
    	//header('Access-Control-Max-Age: 1000');
  //  	header('Access-Control-Allow-Headers: Content-Type, Content-Range, Content-Disposition, Content-Description');
   	//header('content':"application/json");
   	//header('content-type':"application/x-www-form-urlencoded");

 if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            // may also be using PUT, PATCH, HEAD etc
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

    }

	echo json_encode($_POST,true);
?>

