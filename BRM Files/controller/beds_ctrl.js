angular.module('medwise').controller('beds_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.menu_id = [];


    $scope.SortTheData = function (temp){
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
            $medwiseLog.save('Sorted Data Loaded'); 
        }

	$scope.init = function() {
		
		$scope.action = 1;
		$http.get("../php/beds.php?act=all").then(function OnSuccess(res){
            $scope.data = res.data;
            //console.log($scope.data);
            if(Array.isArray($scope.data)) {
                for (var i in $scope.data){
                    $scope.data[i].bed_id = Number($scope.data[i].bed_id);
                    $scope.data[i].rentAmount = Number($scope.data[i].rentAmount);
                 }
                $scope.noRecords = false;
            } else {
                $scope.noRecords = true;
                $scope.data = [];
            }
		 });
		
		$medwiseLog.save('Users','extra Data');
        
    }
    
	 $http.get("../php/locations.php?action=select_loc").then(function OnSuccess(res){
			$scope.locations=res.data;
			//console.log($scope.locations);
         });
         
    $scope.add_bed=function()
        {
                $scope.action=2;			
        }
    
    $scope.Home = function(){
        for(var i in $scope.menu_id){
            $scope.menu_id[i] = 0;
        }
        $scope.action = 1;
    }
        
	$scope.save_bed=function(){
		var data = $.param({
            bed_code: $scope.bed_code,
            bed_loc_id: $scope.bed_loc_id,
            extra_data: $scope.extra_data,
            rent_amount: $scope.rent_amount				
        });
        
        var config = {
            headers : {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };

		$http.post("../php/beds.php?act=add", data, config).then(function OnSuccess(res){
			$scope.result = res.data;
			//console.log(res.data);			 
			$scope.action = 1;
			$scope.init();
			
        });
        
		$scope.bed_code='';
		$scope.bed_loc_id='';
		$scope.extra_data='';	
	}
	
	$scope.get_bed_menu=function(ind, bed_id){
  		$scope.result="";
		if($scope.menu_id[ind] != bed_id)
			$scope.menu_id[ind] = bed_id;
		 else
			$scope.menu_id[ind]=0;
		    
			$scope.update_bed=function(bed_id,x)
			{
			 
				var data = $.param({
						bed_code: x.bed_code,
						bed_loc_id: x.bed_loc_id,
						extra_data: x.extra_data,
						rent_amount: x.rentAmount,
						bed_id:bed_id
						});
				
					var config = {
						headers : {
							'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
						}
					}
				$http.post("../php/beds.php?act=up",data,config).then(function OnSuccess(data,status,header,config){
					$scope.result=data.data;
					// console.log(data.data);
				});
				
				//location.reload();
				
			}
	}
});

