angular.module('medwise').controller('supplier_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.ColSpan = 9;
    $scope.temp = new Date();
    $scope.day = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });


    $(document).ready(function(){
        $("#date_input").datepicker({ dateFormat : 'dd/mm/yy' });
    });
    $scope.Home = function() {
        $scope.update = 0;
        $scope.action = 1;
    }

    $scope.updateFun = function(id){
        if($scope.update != id){
            $scope.update = id;
        }else{
            $scope.update = 0;
         }
    }
  
    $scope.init=function()
    {
        $scope.action=1;
        $http.get("../php/supplier.php?action=all").then(function OnSuccess(res){
                $scope.unit_data = res.data;
                //console.log($scope.unit_data);
                // let {address } = $scope.unit_data[0];
                // console.log(address);
                if(Array.isArray($scope.unit_data)){
                    $scope.NoData = 0;
                    for (var index in $scope.unit_data)
                    {
                        $scope.unit_data[index].id = Number($scope.unit_data[index].id);
                    }
                }else{
                    $scope.unit_data = [];
                    $scope.NoData = 1;
                }

            });
        $medwiseLog.save('Supplier', "Supplier data is opened");
	}

	$scope.save_supplier_data = function ()
	    {
				var data = $.param(
					{
                        name:$scope.name,
                        address:$scope.address,
                        city:$scope.city,
                        contact_person:$scope.contact_person,
						mobile: $scope.mobile,
						gst_no:$scope.gst_no,
						tin_no:$scope.tin_no,
						category:$scope.category
                    });
                var log_data = data;
				var config =
					{
                    headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}
                    }
				$http.post("../php/supplier.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
					//console.log(data.data);
                    $scope.action = 1;
                    $route.reload();
					//location.reload();
					//console.log(data);
                });
                $medwiseLog.save('Supplier', log_data);
        }


		$scope.change_status = function (id, supply_status, index) {
            //alert('Are You Sure' + index);
            $http.get("../php/supplier.php?action=update_status&supplier_id=" + id).then(function OnSuccess(res) {
                //console.log(res.data);
            });
            $route.reload();
            $medwiseLog.save('Supplier', 'id = ' + id + 'Status = ' + supply_status);
        }



	$scope.update_supplier=function(x)
	    {
            //console.log(x);
		    var data = $.param({
                        id: x.id,
                        name:x.name,
                        address:x.address,
                        city:x.city,
                        contact_person:x.contact_person,
						mobile: x.mobile,
						gst_no:x.gst_no,
						tin_no:x.tin_no,
						category:x.category
                });
                //console.log(x);
            var log_data = data;
            var config = {
							headers : {
								'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							}
						}
		$http.post("../php/supplier.php?action=update",data,config).then(function OnSuccess(data,status,header,config){
            $scope.result=data.data;
			//console.log(data.data);
			//console.log(data);
            });

		$route.reload();
        //location.reload();
        $medwiseLog.save('Supplier', log_data);
	}




	$scope.get_city_data=function(sdata)
        {
            if(sdata.length >= 3)
            {
            $scope.seg=$filter('filter')($scope.unit_data,sdata);
            // $scope.seg=res.data;
            //console.log($scope.seg);
            }
        $medwiseLog.save('City Data Retrieved', sdata);
        }

    $scope.insert_spec_data=function(qual)
        {
            $scope.city=qual;
            $scope.seg='';
            $medwiseLog.save('Suggestions Loaded', qual);
		}


    $scope.SortTheData = function (temp)
    {
        $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
        $scope.sort = temp;
        $medwiseLog.save('Sorted Data Loaded');
     }

		// $scope.get_specialization_data=function(sdata)
		// {
		// 	$http.get("../php/login.php?action=get_specialization&sdata="+sdata).then(function OnSuccess(res){
		// 		console.log(res.data);
		// 		$scope.user_spec=res.data;
		// 	 });
		// }

		// $scope.insert_spec_data=function(qual)
		// {
		// 	$scope.specialization=qual;
		// 	$scope.user_spec='';
		// }


});
