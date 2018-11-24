angular.module('medwise').controller('hospitals_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function() {
			$scope.action=1;
	$http.get("../php/hospital.php?action=select").then(function OnSuccess(res){
            $scope.hospital = res.data;

            if(Array.isArray($scope.hospital)) {
                $scope.noRecords = false;
            } else {
                $scope.noRecords = true;
                $scope.hospital = [];
            }
		 });
		$http.get("../php/hospital.php?action=group").then(function OnSuccess(res){
		//console.log(res.data);
 			$scope.fec_grps=res.data;
		 });
		//$medwiseLog.save('Hospital','Click on Hospital Menu');
        
	}
	
	$scope.change_status=function(hid,status,index){		 
		if(status==1)
			status=0;
		else
			status=1;
		$scope.hospital[index].status=status;
		$http.get("../php/hospital.php?act=st&status="+status+"&hid="+hid).then(function OnSuccess(res){
			//console.log(res.data);
		 });
		
	}
	$scope.add_hospital=function(){
			$scope.action=2;
			/*$http.get("../php/hospital.php?action=add").then(function OnSuccess(res){
			$scope.hospital=res.data;
			
		 });*/
			
	}
	
	$scope.get_hospital_menu=function(hosp_id){
		$scope.result="";
		if($scope.hosp_uid!=hosp_id)
			$scope.hosp_uid=hosp_id;
		else
			$scope.hosp_uid=0;
		/*$http.get("../php/login.php?user_menu=yes&user_id="+user_id).then(function OnSuccess(res){
			$scope.user_menu=res.data;
			//console.log(res.data);
		 });
		 
		$http.get("../php/login.php?branch=yes&user_id="+user_id).then(function OnSuccess(res){
			$scope.branch=res.data;
			console.log(res.data);
		 });*/
	
	}
	
	$scope.save_hospital=function(){
		$scope.status=0;
		$scope.hospital='';
		for(var i=0;i<$scope.hospital.length;i++){
			//console.log($scope.users[i].email+'='+email);
				if($scope.hospital[i].email==$scope.hosp.email)
					$scope.status=1;	
		}
		if($scope.status==0){		
			var data = $.param({
					hosp: $scope.hosp,
					
				});
				var config = {
					headers : {
						'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
					}
				}
				//console.log(data);
			$http.post("../php/hospital.php?action=add",data,config).then(function OnSuccess(data,status,header,config){
				//console.log(data.data);
				$scope.hospital=data.data;
				$scope.action=1;
			});	
			
		}
	}
	
	$scope.delete_hospital=function(hid){
		$scope.hospital='';
		$http.get("../php/hospital.php?action=delete&delete_hid="+hid).then(function OnSuccess(res){
			//console.log(res);																			  
			$scope.result='Hospital deleted Successfully!';
			$scope.hospital=res.data;
		 });
	}
	
	
	$scope.update_hospital=function(x){
		var data = $.param({
				name: x.hname,
                address: x.haddress,
                city: x.hcity,
				email: x.hemail,
				mobile: x.hmobile,
				phone: x.hphone,
				hcode: x.hcode,
				fecility_grp: x.fecility_grp,
				hospital_id : x.hid
            });
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/hospital.php?action=update",data,config).then(function OnSuccess(data,status,header,config){ 
		   //console.log(data.data);																
			$scope.result=data.data;
		});
		location.reload();
	}
	
	
	
});

