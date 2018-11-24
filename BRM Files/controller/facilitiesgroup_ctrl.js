angular.module('medwise').controller('facilitiesgroup_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function(){
			$scope.action=1;			 
	$http.get("../php/fecilities.php?fecilities_group=all").then(function OnSuccess(res){
		//console.log(res.data);
             $scope.fec_grps = res.data;
             if(Array.isArray($scope.fec_grps)) {
                $scope.noRecords = false;
             } else {
                $scope.noRecords = true;
                $scope.fec_grps = [];
             }
		 });
		$medwiseLog.save('Users','extra Data');
        
	}
	
	$scope.change_status=function(fcgid,status,index){
		 
		if(status==1)
			status=0;
		else
			status=1;
		$scope.fec_grps[index].fcg_status=status;
		$http.get("../php/fecilities.php?act=fcgst&status="+status+"&fcgid="+fcgid).then(function OnSuccess(res){
			//console.log(res.data);
		 });
		
	}
	
		$scope.addfecgrp=function(){
			$scope.action=2;
			
			//$scope.user='';
			//$http.get("../php/login.php?levels=all").then(function OnSuccess(res){
			//$scope.levels=res.data;
			
		 //});
		 
			
	}
	
			$scope.save_fecgrp=function(){
		var data = $.param({
				fcgname: $scope.fcgname,
                fcgdesc: $scope.fcgdesc
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/fecilities.php?act=addgrp",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			 //console.log(data.data);
			$scope.action=1;
			$scope.init();
		});
		$scope.fcgname='';
		$scope.fcgdesc='';
	}
	
	$scope.get_fecigrp_menu=function(fcgid){
  		$scope.result="";
		if($scope.menu_uid!=fcgid)
			$scope.menu_uid=fcgid;
		 else
			$scope.menu_uid=0;			 
		 
		$http.get("../php/fecilities.php?fecilities_group=yes&fcgid="+fcgid).then(function OnSuccess(res){
			//console.log(res.data);
			$scope.fc=res.data;
			$scope.fec_grp=$scope.fc[0];
			 
		 });
		
 			$scope.update_fecgrpi=function(fcgid){
	 
		var data = $.param({
				fcgname: $scope.fec_grp.fcgname,
                fcgdesc: $scope.fec_grp.fcgdesc,
 				fcgid:fcgid
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/fecilities.php?act=updategrp",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			 //console.log(data.data);
		});
		
		location.reload();
		
	}
		
	}
	
	$scope.delete_fecgrp=function(fcg_id){
		$http.get("../php/fecilities.php?act=delgrp&fcg_id="+fcg_id).then(function OnSuccess(res){
			$scope.result=res.data;
 			$scope.init();
		 });
	}
}); 


