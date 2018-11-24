angular.module('medwise').controller('facilities_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function(){
			$scope.action=1;
	    $http.get("../php/fecilities.php?fecilities=all").then(function OnSuccess(res){
            $scope.fecidata = res.data;
            //console.log($scope.fecidata);
            if(Array.isArray($scope.fecidata)) {
                $scope.noRecords = false;
            } else {
                $scope.noRecords = true;
                $scope.fecidata = [];
            }
		 });
		  $http.get("../php/items.php?act=tax").then(function OnSuccess(res){
            $scope.texdata=res.data;
            //console.log($scope.texdata);
		 });
		$medwiseLog.save('Users','extra Data');
        
	}
			$scope.addfec=function(){
			$scope.action=2;
			
			//$scope.user='';
			//$http.get("../php/login.php?levels=all").then(function OnSuccess(res){
			//$scope.levels=res.data;
			
		 //});
		 $http.get("../php/hospital.php?action=group").then(function OnSuccess(res){
			 //console.log(res.data);
			$scope.feci_grp=res.data;
			 
			 
		 });
			
	}
	
	$scope.change_status=function(fcid,status,index){		 
		if(status==1)
			status=0;
		else
			status=1;
		$scope.fecidata[index].fc_status=status;
		$http.get("../php/fecilities.php?act=fcst&fc_status="+status+"&fcid="+fcid).then(function OnSuccess(res){
			//console.log(res.data);
		 });
		
	}
	
		$scope.save_fec=function(){
		var data = $.param({
				fcname: $scope.fcname,
                fcdesc: $scope.fcdesc,
				fcgid:$scope.fcgid,
				tax:$scope.tax
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/fecilities.php?act=add",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			// console.log(data.data);
			$scope.action=1;
			$scope.init();
			$scope.fcname='';
			$scope.fcdesc='';
			$scope.fcgid='';
		});
			$scope.fcname='';
			$scope.fcdesc='';
			$scope.fcgid='';
			$scope.tax='';
	}
	
	$scope.get_feci_menu=function(fc_id){
  		$scope.result="";
		if($scope.menu_uid!=fc_id)
			$scope.menu_uid=fc_id;
		 else
			$scope.menu_uid=0;
		
 					$http.get("../php/hospital.php?action=group").then(function OnSuccess(res){
			 //console.log(res.data);
			$scope.feci_grp=res.data;
			 
			 
		 });
		$http.get("../php/fecilities.php?fecilities=yes&fc_id="+fc_id).then(function OnSuccess(res){
			//console.log(res.data);
			$scope.fc=res.data;
			$scope.fecility=$scope.fc[0];
			 
		 });
		
 			$scope.update_feci=function(fc_id){
	 
		var data = $.param({
				fcname: $scope.fecility.fcname,
				fcode: $scope.fecility.fcode,
                fcdesc: $scope.fecility.fcdesc,
				fcfcgid: $scope.fecility.fcgid,
				tax: $scope.fecility.tax,
				fcid:fc_id
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/fecilities.php?act=up",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			// console.log(data.data);
		});
		
		location.reload();
		
	}
		
	}
	
	$scope.delete_fec=function(fc_id){
		$http.get("../php/fecilities.php?act=del&fcid="+fc_id).then(function OnSuccess(res){
			$scope.result=res.data;
 			$scope.init();
		 });
	}
});

