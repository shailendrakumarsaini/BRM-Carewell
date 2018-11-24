angular.module('medwise').controller('assetoutward_ctrl', function ($scope,$log,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
	$scope.out = {};
    $scope.out.items_list = [];
	$scope.out.ao_user_id = $scope.login_data.edwise['uid'];
	//$scope.out.ao_transactiontime = todayDate;

    $scope.test = function(){
       if(sss=1){
           $scope.sss = 0;
       }
       $scope.action = 1 ;
    }

	$scope.init=function(){
		$scope.action=1;
	    $http.get("../php/asset_outward_register.php?action=store").then(function OnSuccess(res){
            $scope.unit_data=res.data;
	    	//console.log($scope.unit_data);
			$scope.ss=1;
		 });
		 $http.get("../php/asset_outward_register.php?action=all").then(function OnSuccess(res1){
            $scope.details1_data=res1.data;
            if(Array.isArray($scope.details1_data)){
                $scope.NoData = 0;
            }else{
                $scope.details1_data = [];
                $scope.NoData = 1;
            }
			});
		$medwiseLog.save('Asset Outward','Asset outward opened');
    }


    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }


	$scope.mx = function(x,y)
	{
		if (parseInt(x)>parseInt(y))
		{
			return parseInt(y);
		}
	else
		{
		return parseInt(x);
		}
	}

	$scope.add_show = function()
        {
            $scope.action=2;
            $scope.sss=1;
            $scope.get_data = [];
            $scope.transactiontime = new Date();
            $scope.out.ao_transactiontime = $scope.transactiontime.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
            // $scope.temp = new Date();
            // $scope.transactiontime = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
            // $scope.out.ao_transactiontime = $scope.transactiontime;
        }
   

	$scope.get_item = function(fid){
        // alert(fid);
        // alert($scope.unit_data[fid].id);

        $scope.out.items_list = [];
		$http.get("../php/asset_stock_register.php?action=outward_specific_store&store_id=" + $scope.unit_data[fid].id).then(function OnSuccess(res){
            $scope.get_data = res.data;
            if(!Array.isArray($scope.get_data)) {
                $scope.get_data = [];
            }
			//console.log($scope.get_data);
			$scope.out.ao_fromstore_id = $scope.unit_data[fid].id;
			$scope.out.ao_fromstore_name = $scope.unit_data[fid].store_name;
			$scope.don = $scope.unit_data[fid].store_name;
			$scope.ss = 1;
			$scope.tidx = "";
			$scope.query = "";
			});


	}
	$scope.item_remove=function(index)
        {
            $scope.out.items_list[index].received_quantity = '';
            $scope.out.items_list.splice(index,1);
        }
	$scope.search_item=function(tid){
        $scope.out.ao_tostore_id = $scope.unit_data[tid].id;
        $scope.out.ao_tostore_name = $scope.unit_data[tid].store_name;
        $scope.s = 1;
        $scope.query = "";
        }

	$scope.show_outward=function(idx){

		$http.get("../php/asset_outward_register.php?action=transcation_id&transcation_id=" +idx).then(function OnSuccess(res){
			$scope.outward_data = res.data;


		//console.log($scope.outward_data);

			});


	}
     /*   $scope.checkamount=function(x,y)
		{
			alert(x);
			alert(y);

			 if(x>y)
			 {
			$scope.received_quantity = y;
			x.preventDefault();

		}
		} */

         $scope.toggleGuess=function(){
            if($scope.query=='')
                $('p').hide();
            else
                $('p').show();

		 }



	$scope.get_details=function(xid,zid,ssid){
		$http.get("../php/asset_stock_register.php?action=stock_details&store_id=" +xid + "&item_id="+zid).then(function OnSuccess(res){
			$scope.details_data=res.data;
			 $scope.itid=zid;
                $http.get("../php/asset_outward_register.php?action=all").then(function OnSuccess(res1){
                    $scope.details1_data=res1.data;
                    //console.log($scope.details1_data);
                });

			 $scope.query="";
             $('p').hide();
            //console.log($scope.details_data.length);
		    //console.log($scope.details_data);
			var items = {
						item_id:$scope.details_data[0].asset_id,
						store_name: $scope.details_data[0].store_name,
						asset_name:$scope.details_data[0].asset_name,
						quantity:$scope.details_data[0].quantity,
						received_quantity:""
					}
            $scope.out.items_list.push(items);
			});
		$scope.ss=2;
		//default date
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1; //January is 0!
            var yyyy = today.getFullYear();

            if(dd<10) {
            dd = '0'+dd
            }

            if(mm<10) {
            mm = '0'+mm
            }

        $scope.today = yyyy +'/'+mm+'/'+dd;
        $scope.out.ao_transactiontime=today;


	}


	 $scope.save_out_data = function ()
	    {

			$scope.out.ao_transactiontime=$filter('date')($scope.out.ao_transactiontime, "yyyy-MM-dd h:m:s a")
			//console.log($scope.out);
				var data = $.param({
					asset_outward:$scope.out
				});
				var config =
					{
					headers:{
							'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							}
					}
				$http.post("../php/asset_outward_register.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
					//console.log(data.data);
					$scope.action = 1;
				//	console.log(data);

				});
				//alert("Data Updated Sucessfully");
				$medwiseLog.save('Asset Outward', data);
				$route.reload();

				}



	/*	$scope.get_item = function (fid)
	    {

			$http.get("../php/asset_stock_register.php?action=specific_store&store_id=" +fid).then(function OnSuccess(res){
			$scope.get_data=res.data;
			$scope.test=fid;
			console.log($scope.get_data[0].asset_name);

		});
		}   */


	/*	$scope.add_item = function (iid,nid)
	    {
		alert(iid);
			alert(nid);
			$http.get("../php/asset_stock_register.php?action=stock_details&store_id=" +iid + "&item_id="+nid).then(function OnSuccess(res){
			$scope.add_data=res.data;
			console.log($scope.add_data);


		});
		} */

});
