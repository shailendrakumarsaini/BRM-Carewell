angular.module('medwise').controller('casualtymedicine_ctrl', function ($scope,$http,$filter,$window,$location,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
	$scope.currentParams = $route.current.params;


	$scope.init = function(){
        $scope.tempDateModelFromDate = new Date();
        $scope.tempDateModelToDate = new Date();
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $http.get("../php/casulity_medicine.php?action=get_specificedate&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
            $scope.allCasualtyData = res.data;
            //console.log($scope.allCasualtyData);
            if(Array.isArray($scope.allCasualtyData)){
                $scope.NoData = 0;
            } else {
                $scope.allCasualtyData = [];  
                $scope.NoData = 1;
            }
        });

	    // $http.get("../php/casulity_medicine.php?action=getCasualtyData").then(function OnSuccess(res){
        //         $scope.allCasualtyData = res.data;
        //         //console.log($scope.allCasualtyData);
        //         if(Array.isArray($scope.allCasualtyData)){
        //             $scope.NoData = 0;
        //         } else {
        //             $scope.allCasualtyData = [];
        //             $scope.NoData = 1;
        //         }
        //     });
        $scope.action = 1;
            $scope.currentParams = $route.current.params;
            if($scope.currentParams.patientId !== undefined) {
                $scope.add_casuality();
                $scope.autosearch_data($scope.currentParams.name);
            }
		//$medwiseLog.save('Users','extra Data');
    }

    $scope.byDate = function()
        {
            $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
            $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
            $http.get("../php/casulity_medicine.php?action=get_specificedate&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
                $scope.allCasualtyData = res.data;
                //console.log($scope.allCasualtyData);
                if(Array.isArray($scope.allCasualtyData)){
                    $scope.NoData = 0;
                } else {
                    $scope.allCasualtyData = [];
                    $scope.NoData = 1;
                }
            });
        }

    $scope.redirectToNewPatientPage = function(){
        $location.path("/newpaitent");
    }

    $scope.add_casuality = function(){
        $scope.DisableAddBtn = 1;
        $scope.ShowTable = 0;
        $scope.casualtyMed = {};
        $scope.tempobj = {};
        $scope.casualtyMed.casualtyDetails = [];
        $scope.tempDateModel = new Date();
        $scope.casualtyMed.date_time = $scope.tempDateModelFromDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
	    	$http.get("../php/store.php?action=all").then(function OnSuccess(res){
            $scope.store_data = res.data;
            //console.log($scope.store_data);
            });
        $scope.action = 2;
    }


    $scope.change_from_date = function(){
        var splitDate = $scope.from_date_for_model.split("/");
        $scope.from_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
				//alert($scope.from_date);
				$http.get("../php/casulity_medicine.php?action=get_specificedate&from_date="+ $scope.from_date + "&to_date="+ $scope.to_date).then(function OnSuccess(res){
						$scope.allCasualtyData = res.data;
				        //console.log($scope.allCasualtyData);
				        if(Array.isArray($scope.allCasualtyData)){
				            $scope.NoData = 0;
				        } else {
				            $scope.allCasualtyData = [];
				            $scope.NoData = 1;
				        }
				    });
    }

		$scope.change_to_date = function(){
        var splitDate = $scope.to_date_for_model.split("/");
        $scope.to_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
				//alert($scope.to_date);
				$http.get("../php/casulity_medicine.php?action=get_specificedate&from_date="+ $scope.from_date + "&to_date="+ $scope.to_date).then(function OnSuccess(res){
						$scope.allCasualtyData = res.data;
				        //console.log($scope.allCasualtyData);
				        if(Array.isArray($scope.allCasualtyData)){
				            $scope.NoData = 0;
				        } else {
				            $scope.allCasualtyData = [];
				            $scope.NoData = 1;
				        }
				    });
    }

		$scope.changeDate = function(){
        var splitDate = $scope.date.split("/");
        $scope.casualtyMed.date_time = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
    }

        $scope.autosearch_data = function (temp) {
			if(temp != ""){
            	$http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
                    $scope.collection_data = res.data;
                    console.log($scope.collection_data);
                    if (!Array.isArray($scope.collection_data)) {
                        $scope.collection_data = [];
                    }
					
					if($scope.currentParams.patientId !== undefined) {
						for(var i in $scope.collection_data) {
							if($scope.collection_data[i].patient_id	== $scope.currentParams.patientId) {
								$scope.casualtyMed.PatientDetails = $scope.collection_data[i];
								$scope.SelectPatient($scope.collection_data[i]);
								break;
							}
						}
					}
                });
			}
        }   


    $scope.SelectPatient = function(obj){
		//console.log(obj);
        $scope.casualtyMed.patient_id = obj.patient_id;
        $http.get("../php/collection.php?action=get_latest_visit&patient_id=" + obj.patient_id).then(function OnSuccess(res) {
			//console.log(res.data);
			$scope.casualtyMed.visit_id = res.data[0].p_visit_id;
		});
    }

    $scope.SelectStore = function(store_name){
        $scope.tempobj.store_name = store_name.store_name;

    }

    $scope.SelectMedicine = function(obj ,ind){
        $scope.tempobj.medicine_stock_id = obj.medicine_stock_id;
        $scope.tempobj.med_id = obj.med_id;
        $scope.tempobj.med_name = obj.med_name;
        $scope.tempobj.store_name = obj.store_name;
    }

    $scope.CheckQty = function(){
        if($scope.tempobj.medDetails === undefined){
            swal('Select Medicine Frst');
            $scope.tempobj.quantity = '';
            return;
        }
        if(Number($scope.tempobj.quantity) > Number($scope.tempobj.medDetails.quantity)){
            swal('Quantity Not More Then Available Quantity');
            $scope.tempobj.quantity = $scope.tempobj.medDetails.quantity;
        }
    }

    $scope.AddItem = function (){
        delete $scope.tempobj.medDetails;
        $scope.casualtyMed.casualtyDetails.push($scope.tempobj);
        $scope.tempobj = {};
		var index = $scope.casualtyMed.casualtyDetails.length - 1;
        $scope.tempobj.store_id = $scope.casualtyMed.casualtyDetails[index].store_id;
        $scope.tempobj.medDetails = {};
        //$scope.tempobj.quantity = '';
        $scope.ShowTable = 1;
    }

    $scope.DeleteItem = function (ind) {
        $scope.casualtyMed.casualtyDetails.splice(ind, 1);
        if($scope.casualtyMed.casualtyDetails.length == 0){
            $scope.ShowTable = 0;
        }
        $scope.DisableAddBtn = 0;
    }

    $scope.autosearch_data_for_medicine = function (temp) {
        if(temp != ''){
            if($scope.tempobj.store_id === undefined){
                swal('First Select Store');
                return;
            }
            $http.get("../php/medicine_stock_register.php?action=getStockOfStoreIfNotEmpty&search_string=" + temp + "&store_id=" + $scope.tempobj.store_id).then(function OnSuccess(res) {
                $scope.medunits_data = res.data;
                //console.log($scope.medunits_data);
                if (!Array.isArray($scope.medunits_data)) {
                    $scope.medunits_data = [];
                }
            });
        } else {
            $scope.medunits_data = [];
        }
    }


    $scope.SaveCasualtyData = function() {
            delete $scope.casualtyMed.PatientDetails;
            var data = $.param({
                casualtyMed : $scope.casualtyMed
            });
            //console.log($scope.casualtyMed);
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            $http.post("../php/casulity_medicine.php?action=add",data,config).then(function OnSuccess(res,status,header,config){
                //console.log(res.data);
                $scope.init();
                $scope.action = 1;
                // if($scope.currentParams.patientId !== undefined){
                //     $location.path("/newpaitent");
                // }
            });
            $medwiseLog.save('Users','extra Data');
    }

		$scope.show_details = function(visit_id){
			$scope.rec_code = '';
			$http.get("../php/casulity_medicine.php?action=CasualtyData&visit_id=" + visit_id).then(function OnSuccess(res) {
				$scope.casualtyData = res.data;
				//console.log(res.data);
				$scope.total = 0;
				for(var i in $scope.casualtyData){
					$scope.total = $scope.total + ($scope.casualtyData[i].price * $scope.casualtyData[i].quantity);
				}
			});
		}


    $scope.show_items = function(visit_id, patient_id){
		//alert(patient_id);
		$scope.rec_code = '';
        $http.get("../php/casulity_medicine.php?action=CasualtyData&visit_id=" + visit_id).then(function OnSuccess(res) {
			$scope.casualtyData = res.data;
			//console.log(res.data);
			$scope.total = 0;
			for(var i in $scope.casualtyData){
				$scope.total = $scope.total + ($scope.casualtyData[i].price * $scope.casualtyData[i].quantity);
				if($scope.casualtyData[i].issued == 0) {
					$scope.casualtyData[i].issued = false;
				} else {
					$scope.casualtyData[i].issued = true;
				}
				
				if($scope.casualtyData[i].expiry_date !== null) {
					$scope.casualtyData[i].exp_date = new Date($scope.casualtyData[i].expiry_date);
				}
			}
        });
		$http.get("../php/patient_info.php?action=previous_bill_details&patient_id=" + patient_id).then(function OnSuccess(res) {
			$scope.previousBillsList = res.data;
			//console.log($scope.previousBillsList);
			if(Array.isArray($scope.previousBillsList)) {
				$scope.NoData = 0;
			} else {
				$scope.NoData = 1;
			}
		});
    }

		$scope.getBatchAndExpiryDetails = function(rec_code, patient_id){
			// alert(rec_code);
			//alert(patient_id);
			$http.get("../php/collection.php?action=get_receipt_details_for_dcr&receipt_code=" + rec_code + "&patient_id=" + patient_id).then(function OnSuccess(res) {
					$scope.batchAndExpiryData = res.data;
					//console.log($scope.batchAndExpiryData);
					//console.log($scope.batchAndExpiryData[0].paid_details);

				for(var i in $scope.batchAndExpiryData[0].paid_details){
					for(var j in $scope.casualtyData){
						if($scope.batchAndExpiryData[0].paid_details[i].med_id == $scope.casualtyData[j].med_id){
							$scope.casualtyData[j].batch_no = $scope.batchAndExpiryData[0].paid_details[i].batch_no;
							$scope.casualtyData[j].exp_date = new Date($scope.batchAndExpiryData[0].paid_details[i].expiry_date);
							var temp = new Date($scope.batchAndExpiryData[0].paid_details[i].expiry_date);
						  $scope.casualtyData[j].expiry_date = temp.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric'});
						}
					}
				}
			});
		}


		$scope.changeExpiryDate = function(exp_date, index){
			//alert(exp_date);
			var temp = new Date(exp_date);
			if(exp_date !== null) {
				$scope.casualtyData[index].expiry_date = temp.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric'});
			} else {
				$scope.casualtyData[index].expiry_date = null;
			}
			//alert($scope.casualtyData[index].expiry_date);
		}

    $scope.Update = function(visit_id,itemDetails){
				for(let i in $scope.casualtyData){
					 delete $scope.casualtyData[i].exp_date;
				}
			    	//alert(visit_id);
						//console.log(itemDetails);
						// $http.get("../php/casulity_medicine.php?action=change&p_visit_id=" + visit_id).then(function OnSuccess(res) {
			      //     console.log(res.data);
						// 		$route.reload();
						// 		$medwiseLog.save('Users','extra Data');
			      //   });

					var casualtyDetails = {};
					casualtyDetails.visit_id = visit_id;
					casualtyDetails.items = itemDetails;
					casualtyDetails.user_id = $scope.login_data.edwise.uid;
					
					var data = $.param({
							obj : casualtyDetails
					});
					//console.log(itemDetails);
					var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
					$http.post("../php/casulity_medicine.php?action=change",data,config).then(function OnSuccess(res,status,header,config){
							console.log(res.data);
							if($scope.currentParams.patientId !== undefined){
								$scope.init();
							}else{
								$route.reload();
							}
					});
					$medwiseLog.save('Users','extra Data');
    }

    $scope.SortTheData = function (temp) {
        $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
        $scope.sort = temp;
    }


});
