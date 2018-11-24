angular.module('medwise').controller('medicines_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
	$scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level = parseInt($scope.login_data.edwise.level);
	$scope.begin = 1;
    $scope.end = 10;
    $scope.selected_data_sale_unit = {};
    $scope.selected_data_dist_unit = {};
    $scope.rcount = 0;
    $scope.Home = function(){
        $scope.menu_uid= 0;
        $scope.action = 1;  
    }
 
    $scope.init = function () {
		$scope.action = 1;
		$http.get("../php/medicines.php?action=all").then(function OnSuccess(res) {
            $scope.medicine_data = res.data;
            //console.log($scope.medicine_data);  
            if(Array.isArray($scope.medicine_data)) {
                $scope.NoData = 0;
                // for( var i in $scope.medicine_data) {
                //     $scope.menu_uid.push(0);
                // }
            }else{
                $scope.medicine_data = [];
                $scope.NoData = 1;
            }
            //console.log($scope.medicine_data);
			});
        $medwiseLog.save('Medicines', "Medicines is opened");	
    }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }


		$scope.get_group_menu = function (pt_id) {
			//$scope.result="";
			if ($scope.menu_uid != pt_id)
				$scope.menu_uid = pt_id;
			else
				$scope.patient_id = 0;
            //$medwiseLog.save('To get Group', "");	
        }
        

       

    $scope.get_medicine_category = function(medcine){
        //console.log(medcine);
        if(medcine === undefined){
            medcine ='';
            $scope.segg = '';
        }
        if(medcine.length >= 3)
            {
            $scope.segg = $filter('filter')($scope.medicine_data,{ 'med_category':medcine });
            //console.table($scope.segg);
            }
            //$medwiseLog.save('To get Medicines Suggestions',medcine );	 
        }

    $scope.insert_spec_medicine=function(qual)  
        {
            $scope.med_category = qual;
            // console.log(qual);
            // console.log($scope.medCategory);
            $scope.segg='';
            //$medwiseLog.save('To Select Medicines Suggestions',qual);	
        }


    $scope.get_brand_sugg = function(brand){
        //console.log(brand);
            if(brand === undefined){
                brand ='';
                $scope.filtered_brand_sugg = '';
            }
            if(brand.length >= 3)
            {
                $scope.filtered_brand_sugg = $filter('filter')($scope.medicine_data,{'med_brand':brand});
                //console.log($scope.filtered_brand_sugg);
            }
            //$medwiseLog.save('To get Medicines  Brand Suggestions', "");	
        }

    $scope.choose_sugg = function(temp)
        {
            $scope.med_brand = temp;
            $scope.filtered_brand_sugg = "";
            //$medwiseLog.save('To Select Medicines  Brand Suggestions', "");	
        }

    $scope.get_combination_sugg = function(combinations){
        //console.log(combinations);
        if(combinations === undefined){
            combinations = '';
            $scope.filtered_comb_sugg = '';
        }
        if(combinations.length >= 3)
            {
                $scope.filtered_comb_sugg = $filter('filter')($scope.medicine_data,{'med_combination':combinations});
                //console.log($scope.filtered_comb_sugg);
            }
        $medwiseLog.save('To get Medicines combination Suggestions', "");
    }

    $scope.choose_combination_sugg = function(temp)
    {
        $scope.combination_name = temp;
        $scope.filtered_comb_sugg = "";
        $medwiseLog.save('To Select Medicines combination Suggestions', "");	
    }


		$scope.add_medicine = function () {
				var data = $.param({
				med_group_id: $scope.group_name,
				med_category: $scope.med_category,
				med_name: $scope.medicine_name,
				med_brand: $scope.med_brand,
				med_combination: $scope.combination_name,
				med_allow_sale: $scope.allow_sales,
				med_sale_units: $scope.selected_data_sale_unit.unit_obj.unit_name,
				med_distributed_units: $scope.selected_data_dist_unit.unit_obj.unit_name,
                med_tax: $scope.tax_name,
                med_reorder:$scope.reorder,
				med_code: $scope.code,	
                med_hsncode : $scope.hsn_code,
                med_manufacturedby : $scope.manufactured_by,
                med_schedule : $scope.schedule,
                med_no_of_units : $scope.no_of_units,
                med_purchasepack : $scope.purchase_pack,
                med_boxpack : $scope.box_pack,
                med_rockno : $scope.rack_no
			});
			var config = {
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
				}
            }
            //console.log(data);
			$http.post("../php/medicines.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
				//console.log(data.data);

				//$scope.action = 4;
				$route.reload();
				//$scope.op_patient = data.data.patnt;
				//$scope.op_hosp = data.data.hsp;
				//console.log(data);
			});
            $medwiseLog.save('Medicines', data);	
		}


		$scope.change_status = function (med_id, status, index) {
			//alert('im here' + med_id);
			$http.get("../php/medicines.php?action=update_status&medic_id=" + med_id).then(function OnSuccess(res) {
				//console.log(res.data);
				//console.log("sdfaasdlfasdf");
			});
			$route.reload();
            $medwiseLog.save('Medicines', 'medicine_id = ' + med_id + ', status = ' + status);	
        }
        
        $scope.SelectSaleUnit = function(obj){
            //console.log(obj);
            $scope.selected_data_dist_unit.unit_obj = obj;
            //console.log(obj);{}
        }

        $scope.update = function(med_id,obj){
            //console.log(med_id);
            if($scope.menu_uid!= med_id){
                $http.get("../php/medicines.php?action=only_medicals").then(function OnSuccess(res) {
                    $scope.groupitems_data = res.data;
                    $scope.group_name = $scope.groupitems_data[0].ig_id;
                });
                $http.get("../php/assets.php?action=units").then(function OnSuccess(res) {
                    $scope.medunits_data = res.data;
                });
                $http.get("../php/assets.php?action=taxes").then(function OnSuccess(res) {
                    $scope.medtaxes_data = res.data;
                    $scope.tax_name = $scope.medtaxes_data[0].tax_name;
                });
                $scope.menu_uid = med_id;   
            }else{    
                $scope.menu_uid = 0;
            }
				//$scope.selected_data_sale_unit.unit_obj.unit_id = 
				//$scope.selected_data_sale_unit.unit_obj.unit_name = obj.med_sale_units;
                // $scope.selected_data_sale_unit.unit_obj = obj;
                 //console.log(obj);

        }


		$scope.update_medicines = function (x) {
			var data = $.param({
				med_id: x.med_id,
				med_group_id: x.med_group_id,
				med_category: x.med_category,
				med_name: x.med_name,
				med_brand: x.med_brand,
				med_combination: x.med_combination,
				med_allow_sale: x.med_allow_sale,
				med_sale_units: x.med_sale_units,
				med_distributed_units: x.med_distributed_units,
                med_tax: x.med_tax,
                med_reorder:x.med_reorder,
                med_code: x.med_code,
                med_hsncode : x.med_hsncode,
                med_manufacturedby : x.med_manufacturedby,
                med_schedule : x.med_schedule,
                med_no_of_units : x.med_no_of_units,
                med_purchasepack : x.med_purchasepack,
                med_boxpack : x.med_boxpack,
                med_rockno : x.med_rockno
			});

			var config = {
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
				}
			}
            $http.post("../php/medicines.php?action=update", data, config).then(function OnSuccess(data, status, header, config) 
            {
				//console.log(data.data);
				$scope.result = data.data;
				//console.log(data);

			});

			$route.reload();
            $medwiseLog.save('Medicines', data);	
		}
		
		$scope.pre=function(x,y)
		{
			x=x-10;
			y=y-10;
			$scope.begin=x;
			$scope.end=y;
		
		}
        
		$scope.add_inv_unit = function () {
            $http.get("../php/medicines.php?action=only_medicals").then(function OnSuccess(res) {
                $scope.groupitems_data = res.data;
                $scope.group_name = $scope.groupitems_data[0].ig_id;
            });
            $http.get("../php/assets.php?action=units").then(function OnSuccess(res) {
                $scope.medunits_data = res.data;
            });
            $http.get("../php/assets.php?action=taxes").then(function OnSuccess(res) {
                $scope.medtaxes_data = res.data;
                $scope.tax_name = $scope.medtaxes_data[0].tax_name;
            });
            $scope.action = 2;
            $scope.allow_sales='Yes';
		}

		
		

	



});
