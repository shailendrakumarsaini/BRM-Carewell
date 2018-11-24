angular.module('medwise').controller('assetspos_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
	$scope.items_list=[];
	$scope.init=function(){
			$scope.action=1;
	$http.get("../php/assets_pos.php?action=all").then(function OnSuccess(res){
			$scope.assets_pos=res.data;
		 });
		

        }
      
	   
	   

		$scope.add_item=function(){
					var item_data={
							item_id: '',
							item_units:'',
                            item_mrp:'',
                            item_pp,
                            item_amount,
                            item_qty
					};
			$scope.show_tx=1;
			$scope.items_list.push(item_data);			
		}

		$scope.remove_item=function(idx){
			$scope.items_list.splice(idx, 1);     
		}
	   
	
		$http.get("../php/assets.php?action=all").then(function OnSuccess(res) {
            $scope.groupitems_data = res.data;
            
        }); 

        $http.get("../php/assets.php?action=units").then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
            
        });

        $http.get("../php/assets.php?action=taxes").then(function OnSuccess(res) {
            $scope.medtaxes_data = res.data;

        });
         
        
	


	
	$scope.save_asset_po_data = function () 
	    {
			//alert("OK");	
				var data = $.param(
					{
                        assetpo_date:$scope.assetpo_date,
                        assetpo_supplier_id:$scope.assetpo_supplier_id,
                        assetpo_price:$scope.assetpo_price,
                        assetpo_tax:$scope.assetpo_tax,
                        assetpo_net_price:$scope.assetpo_net_price 	
					});
				var config = 
					{
					headers:{
							'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							}
					}
				$http.post("../php/assets_pos.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
					console.log(data.data);
					$scope.action = 1;
					//location.reload();
					console.log(data);
					
				});			
        }



        $scope.get_item_data=function(sdata)
		{
			$http.get("../php/login.php?action=get_specialization&sdata="+sdata).then(function OnSuccess(res){
				console.log(res.data);
				$scope.user_spec=res.data;
			 });
		}
		
		$scope.insert_spec_data=function(qual)
		{
			$scope.specialization=qual;
			$scope.user_spec='';
        }
        


	
});

