angular.module('medwise').controller('pharmacybilling_ctrl', function ($scope,$http,$filter,$window,$route,$location,$medwiseLog, $timeout) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.level_name = $scope.login_data.edwise.level_name;
    $scope.pharmacy_lab_billing = {};
    $scope.pharmacy_lab_billing.Arr = [];
    $scope.pharmacy_lab_billing.hospital_id = '1';
    $scope.pharmacy_lab_billing.payment_type = 'Cash';
    $scope.pharmacy_lab_billing.user_id = $scope.login_data.edwise.uid;
    $scope.pharmacy_add_btn_disable = 1;
    $scope.show_pharmacy_total = 0;
    $scope.showNoPrescriptions = false;
    $scope.error = 0;
    $scope.selected_data = {};
    $scope.hideUiSelect = 1;
	$scope.t = 0;
	$scope.PrintShow = 0;

 	$scope.test = function(obj){
		//console.log(obj);
		if($scope.t == 0){
			$scope.ShowTableFun(obj);
		}else{
		$scope.t = 0;
		}
	}


    $scope.init = function () {
        $scope.tempArr = [];
		$scope.tempDateModel = new Date();
        $scope.pharmacy_lab_billing.transaction_date = $scope.tempDateModel.toLocaleDateString('en-US' , {day:'2-digit', month: 'long', year: 'numeric'});
        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
            $scope.Doctors = res.data;
            });
        //  $http.get("../php/medicine_stock_register.php?action=get_medicines_stock_list_from_dpo").then(function OnSuccess(res) {
        //     $scope.medunits_data = res.data;
        //     //console.log($scope.medunits_data);
        //     if(!Array.isArray($scope.medunits_data)){
        //         $scope.medunits_data = [];
        //     }
        //  });
        $http.get("../php/hospital.php?action=select").then(function OnSuccess(res) {
            $scope.hospital = res.data;
            //console.table($scope.hospital);
        });
        $scope.action = 1;
        $scope.currentParams = $route.current.params;
        if($scope.currentParams.patientId !== undefined) {
            $scope.autosearch_data($scope.currentParams.name);
        }
    }

    $scope.autosearch_data = function (temp) {
        if(temp != ""){
            $http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
                $scope.collection_data = res.data;
                //console.log(res.data);
                if (!Array.isArray($scope.collection_data)) {
                    $scope.collection_data = [];
                }
                if($scope.currentParams.patientId !== undefined) {
                    for(var i in $scope.collection_data) {
                        if($scope.collection_data[i].patient_id	== $scope.currentParams.patientId) {
                            $scope.pharmacy_lab_billing.PatientDetails = $scope.collection_data[i];
                            $scope.SelectPatient($scope.collection_data[i]);
                            break;
                        }
                    }
                }
            });
        }
    }

    $scope.autosearch_data_for_medicine = function (temp) {
        if(temp != ''){
            $http.get("../php/medicine_stock_register.php?action=get_medicines_stock_list&search_string=" + temp).then(function OnSuccess(res) {
                $scope.medunits_data = res.data;
                //console.log($scope.medunits_data);
                if (!Array.isArray($scope.medunits_data)) {
                    $scope.medunits_data = [];
                }
            });
        } else{
            $scope.medunits_data = [];
        }
    }

    $scope.redirectToNewPatientPage = function(){
        $location.path("/newpaitent");
    }


    $scope.refreshMedicinesUiSelect = function(medunits_data) {
        $scope.medunits_data = null;
        $scope.medunits_data = medunits_data;
    }

    $scope.SelectPatient = function(obj) {
        $scope.pharmacy_lab_billing.patient_id = obj.patient_id;
        $http.get("../php/collection.php?action=get_latest_visit&patient_id=" + obj.patient_id).then(function OnSuccess(res) {
            $scope.patient_visit_details = res.data;
            //console.log($scope.patient_visit_details);
            $scope.pharmacy_lab_billing.dr_id = $scope.patient_visit_details[0].doctor_id;
            $scope.pharmacy_lab_billing.p_visit_id = $scope.patient_visit_details[0].p_visit_id;
        });
    }

    $scope.add_new_Paitent = function() {
		$scope.hideUiSelect = 0;
        $scope.selected_data.innerObj = {};
        $scope.pharmacy_lab_billing.patient_id = '';
        $scope.pharmacy_lab_billing.p_visit_id = '';
        $scope.pharmacy_lab_billing.dr_id = '';
    }

    $scope.back_to_ui_select = function(){
        $scope.pharmacy_lab_billing.patient_name = '';
        $scope.hideUiSelect = 1;
    }


    $scope.ShowTableFun = function (obj) {
        $scope.t = 1;
        //console.log(obj);
        var tempobj = {
            med_id : obj.med_id,
            med_name : obj.med_name,
            price : obj.price,
            quantity : obj.quantity,
            medicine_stock_id : obj.medicine_stock_id,
            expiry_date : obj.expiry_date,
            tax_name : obj.tax_name,
            tax_percent : obj.tax_percent,
			purchase_price : obj.purchase_price,
            req_qty : 1,
            obj: obj
        };

        tempobj.tax_price = (Number(tempobj.price) * Number(tempobj.req_qty)) *tempobj.tax_percent/100;
        tempobj.net_price = Number(tempobj.price) * Number(tempobj.req_qty) - tempobj.tax_price;
        // alert(tempobj.amount);
        // alert(tempobj.net_price);
        $scope.pharmacy_lab_billing.Arr.push(tempobj);
        // console.log(tempobj);
        // console.log($scope.pharmacy_lab_billing);
        $scope.pharmacy_lab_billing.total_amount = 0;
        for(var i in $scope.pharmacy_lab_billing.Arr) {

            $scope.pharmacy_lab_billing.total_amount += ($scope.pharmacy_lab_billing.Arr[i].net_price + $scope.pharmacy_lab_billing.Arr[i].tax_price);
        }

        for(var i in $scope.medunits_data) {
            if(obj.medicine_stock_id === $scope.medunits_data[i].medicine_stock_id) {
                $scope.medunits_data.splice(i, 1);
            }
        }

        //console.log($scope.medunits_data);
        //console.log($scope.tempArr);
        $scope.showTable = 1;
        $scope.filter_data = '';
        $scope.check = '';
    }

    $scope.MedicineSuggestionOutOfFocus = function() {
        $(".medicine-suggestions").hide();
        //$scope.filter_data = '';
        $scope.check = '';
    }

    $scope.testFun = function (check){
        $scope.filter_data = $filter('filter')($scope.medunits_data, { med_name: check });
        //console.log($scope.filter_data);
    }

    $scope.chechQty = function(iqty,ind,value){
        if(Number(value) > Number(iqty)){
            swal('Required Quantity Not More Then Actual Quantity');
            $scope.pharmacy_lab_billing.Arr[ind].req_qty = iqty;
          }
        $scope.pharmacy_lab_billing.total_amount = 0;
        $scope.pharmacy_lab_billing.Arr[ind].net_price = ($scope.pharmacy_lab_billing.Arr[ind].req_qty * $scope.pharmacy_lab_billing.Arr[ind].price) - ($scope.pharmacy_lab_billing.Arr[ind].req_qty * $scope.pharmacy_lab_billing.Arr[ind].price) * $scope.pharmacy_lab_billing.Arr[ind].tax_percent/100;
        for(var i in $scope.pharmacy_lab_billing.Arr){
            $scope.pharmacy_lab_billing.Arr[i].net_price
          $scope.pharmacy_lab_billing.total_amount += $scope.pharmacy_lab_billing.Arr[i].req_qty * $scope.pharmacy_lab_billing.Arr[i].price;
        }
        //alert($scope.pharmacy_lab_billing.total_amount);
    }

    $scope.save_pharmacy_billing_data = function(){
        if($scope.pharmacy_lab_billing.total_amount == undefined){
            swal('Select Medicine');
            return;
        }
            delete $scope.pharmacy_lab_billing.PatientDetails;
            var data = $.param({ pharmacy_billing : $scope.pharmacy_lab_billing });
            //console.log($scope.pharmacy_lab_billing.Arr);
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
            $http.post("../php/collection.php?action=add_pharmacy_billing", data, config).then(function OnSuccess(res, status, header, config){
            $scope.pharmacy_bills_details = res.data;
            //console.log($scope.pharmacy_bills_details);
                $('#PharmacyID').modal('show');
             });
    }


    $scope.ip_print_fun = function (opp)
    {
		$scope.PrintShow = 1;
        var mywindow = window.open('', 'PRINT', 'height=800,width=1200');
        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        //mywindow.document.write('</head><body >');
        //mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(opp).innerHTML);
        mywindow.document.write('</body></html>');
        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/
        mywindow.print();
        mywindow.close();
        $scope.Reload();
        $scope.PrintShow = 0;
        $location.path("/newpaitent");
        return true;
    }

    $scope.Reload = function() {
        $location.path("/newpaitent");
    }

    $scope.DeleteFun = function(ind){
        // //console.log(obj);
        var medunits_data = $scope.medunits_data;
        medunits_data.push($scope.pharmacy_lab_billing.Arr[ind].obj);

        $scope.pharmacy_lab_billing.Arr.splice(ind, 1);

        $scope.pharmacy_lab_billing.total_amount = 0;
        for(var i in $scope.pharmacy_lab_billing.Arr) {
            $scope.pharmacy_lab_billing.total_amount += $scope.pharmacy_lab_billing.Arr[i].req_qty * $scope.pharmacy_lab_billing.Arr[i].price;;
        }

        if($scope.pharmacy_lab_billing.Arr.length == 0){
            $scope.showTable = 0;
        }

        $scope.refreshMedicinesUiSelect(medunits_data);
    }

});
