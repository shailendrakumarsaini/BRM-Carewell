angular.module('medwise').controller('users_ctrl', function ($scope,$http,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
    $scope.action=1;
    
     
	$scope.user_init = function(){

	    $http.get("../php/login.php?users=all").then(function OnSuccess(res){
			$scope.users = res.data;
		});
		$http.get("../php/inpatient.php?action=special").then(function OnSuccess(res){
            //console.log(res.data);
            $scope.user_spec=res.data;
            //console.log($scope.user_spec);
            
        });
		$medwiseLog.save('Users','extra Data');
    }
 
    $(document).ready(function() {
        $("#dojID").datepicker({ dateFormat : 'dd/mm/yy' });
    });

    $scope.changeDate_Through_UiJquery = function(doj){
        //$scope.user.doj = doj; 
		var splitDate = doj.split("/");
		$scope.user.doj = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];		
    }    
    
	$scope.adduser=function() {
		$scope.action=2;
        $scope.user = {};
		$http.get("../php/login.php?levels=all").then(function OnSuccess(res){
			$scope.levels = res.data;
		});		
    }
    
	$scope.get_levels=function() {
		$http.get("../php/login.php?levels=all").then(function OnSuccess(res){
			$scope.levels = res.data;
			//console.log($scope.levels);
		 });
	}
	
	$scope.submituser = function() {
		$scope.status=0;
		for(var i=0; i<$scope.users.length; i++) {
			//console.log($scope.users[i].email+'='+email);
            if($scope.users[i].email == $scope.user.email)
                $scope.status=1;
				
		}
		if($scope.status==0)
				$scope.action=1;	
	}
	
	$scope.get_user_menu=function(user_id){
		$scope.result="";
		if($scope.menu_uid!=user_id)
			$scope.menu_uid=user_id;
		else
			$scope.menu_uid=0;
		$http.get("../php/login.php?user_menu=yes&user_id="+user_id).then(function OnSuccess(res){
			$scope.user_menu=res.data;
			//console.log(res.data);
		 });
		 
		$http.get("../php/login.php?branch=yes&user_id="+user_id).then(function OnSuccess(res){
			$scope.hospital=res.data;
			//console.log(res.data);
		 });
    }
    
	$scope.update_menu=function(level_id){
	
		var data = $.param({
				hospital: $scope.hospital,
                user_menu: $scope.user_menu,
                user_id: $scope.menu_uid,
				level_id: level_id
            });
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/menu_update.php",data,config).then(function OnSuccess(data,status,header,config){
			//console.log(data.data);
			$scope.result = data.data;
		});
		
		location.reload();	
    }
    
	$scope.change_status=function(uid,status,index){
		if(status==1)
			status=0;
		else
			status=1;
		$scope.users[index].status=status;
		$http.get("../php/login.php?status="+status+"&user_id="+uid).then(function OnSuccess(res){
			//console.log(res.data);
		 });
    }
    
	$scope.add_whatsapp = function(){
		$scope.whatsapp = $scope.mobile;
    }
    
	$scope.save_user=function() {
		
		if($scope.status==0){		
			var data = $.param({
                user: $scope.user,
                qualification:$scope.qualification,
                specialization:$scope.specialization,
                mobile:$scope.mobile,
                whatsapp:$scope.whatsapp
            });
            //console.log($scope.user);
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
			$http.post("../php/save_user.php",data,config).then(function OnSuccess(data,status,header,config){
                console.log($scope.result=data.data);
				$http.get("../php/login.php?users=all").then(function OnSuccess(res){
					$scope.users=res.data;
				});
				$scope.action=1;
			});
		}
    }
    
	$scope.delete_user=function(uid){
		$http.get("../php/login.php?delete_uid=" + uid).then(function OnSuccess(res){
			$scope.result=res.data;
			
			$http.get("../php/login.php?users=all").then(function OnSuccess(res){
				$scope.users=res.data;
			});
		 });
    }
    
	$scope.get_qual_data=function(qdata) {
        //console.log(qdata);
        if(qdata === undefined){
            $scope.hide_span_for_Qul = 0;
        }else{
            $http.get("../php/login.php?action=get_qualification&qdata="+qdata).then(function OnSuccess(res){
                //console.table(res.data);
                $scope.user_qual=res.data;
                if(Array.isArray($scope.user_qual)){
                    $scope.hide_span_for_Qul = 1;
                 } else {
                    $scope.hide_span_for_Qul = 0;
                 }
             });
        }
		
	}
	//$scope.insert_qual='';
	$scope.insert_qual_data=function(qual) {
		$scope.qualification=qual;
		$scope.user_qual='';
	}
	
	$scope.get_specialization_data=function() {
        //console.log(sdata);
     
      $http.get("../php/inpatient.php?action=special").then(function OnSuccess(res){
                //console.log(res.data);
                $scope.user_spec=res.data;
				//console.log($scope.user_spec);
               
             });
        
	}
	/* //$scope.insert_qual='';
	$scope.insert_spec_data=function(qual){
		$scope.specialization=qual;
		$scope.user_spec='';
	} */
	
	$scope.insert_mobile=function(mob,chk){
		if(chk==true){
		$scope.whatsapp=mob;
		}else{
		$scope.whatsapp='';	
		}	
	}
	$scope.user_check = function(uname)
	{
		$scope.status=0;
		for(var i=0;i<$scope.users.length;i++){
			//console.log($scope.users[i].email+'='+email);
				if($scope.users[i].username==$scope.user.username)
					$scope.status=1;	
		}
	}
	
});

