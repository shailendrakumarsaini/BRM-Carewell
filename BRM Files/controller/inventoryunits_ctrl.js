angular.module('medwise').controller('inventoryunits_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.menu_uid = [];
    
    $scope.Home = function(){
        for(var i in $scope.menu_uid){
            $scope.menu_uid[i] = 0;
        }
        $scope.action = 1;       
    }

	$scope.init=function(){
        $scope.action=1;
        $http.get("../php/inventory_units.php?act=all").then(function OnSuccess(res){
        $scope.unit_data=res.data;
        //console.log($scope.unit_data);
            if(Array.isArray($scope.unit_data))
            { 
                $scope.NoData = 0;
            }else{
                $scope.unit_data = [];
                $scope.NoData = 1;
            } 
		 });
		$medwiseLog.save('Users','extra Data');
	}
	
	
	$scope.add_inv_unit=function(){
 			$scope.action=2;			
	}
	
	$scope.save_unit=function(){
		var data = $.param({
				unit_name: $scope.unit_name
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/inventory_units.php?act=addinvent",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			 //console.log(data.data);
			$scope.action=1;
			$scope.init();
		});
		$scope.unit_name='';
    }
    
    $scope.invunit_menu = function(unit_id)
    {
  		$scope.result="";
		if($scope.menu_uid != unit_id){
            $scope.menu_uid = unit_id;
        }
		 else{
            $scope.menu_uid = 0;	
         }		 
		 
		// $http.get("../php/inventory_units.php?inve_unit=yes&unit_id="+unit_id).then(function OnSuccess(res){
		// 	//console.log(res.data);
		// 	$scope.fc=res.data;
		// 	$scope.inve_unit=$scope.fc[0];
			 
        //  });
    }
		
 			$scope.update_inv_unit=function(x){
	 
		var data = $.param({
				unit_nmae: x.unit_name,
 				unit_id: x.unit_id
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/inventory_units.php?act=up",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			 //console.log(data.data);
		});
		
		location.reload();
		
	}
		
	
	
	
	$scope.delete_unit=function(unit_id){
		$http.get("../php/inventory_units.php?act=del&unit_id="+unit_id).then(function OnSuccess(res){
			$scope.result=res.data;
 			$scope.init();
		 });
	}
	
	 $scope.change_status=function(unitid,status,index){
		 
		if(status==1)
			status=0;
		else
			status=1;
		$scope.unit_data[index].status=status;
		$http.get("../php/inventory_units.php?act=st&status="+status+"&unit_id="+unitid).then(function OnSuccess(res){
			//console.log(res.data);   
		 });
		
	} 
	
});

