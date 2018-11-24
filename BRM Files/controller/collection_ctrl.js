angular.module('medwise').controller('collection_ctrl', function ($scope, $http, $filter, $window, $route, $location, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.level_name = $scope.login_data.edwise.level_name;
    $scope.collection = {};
    $scope.selected_data = {};
    $scope.shoe_menu = 0;
    $scope.showDetails = 0;
    $scope.collection.paid_details = [];
    $scope.addBtnDisable = 'yes';
    $scope.total = 0;
    $scope.collection.payment_type = 'Cash';
    $scope.collection.hospital_id = '1';
    $scope.lab_billing = {};
    $scope.lab_billing.test = [];
    $scope.lab_billing.payment_type = 'Cash';
    $scope.lab_billing.hospital_id = '1';
    $scope.addBtnDisable_for_bill = 'yes';
    $scope.pharmacy_lab_billing = {};
    $scope.pharmacy_lab_billing.Arr = [];
    $scope.pharmacy_lab_billing.hospital_id = '1';
    $scope.pharmacy_lab_billing.payment_type = 'Cash';
    $scope.pharmacy_add_btn_disable = 1;
    $scope.show_pharmacy_total = 0;
    $scope.showNoInvestigations = false;
    $scope.showNoPrescriptions = false;
    $scope.PrintShow = 0;
    $scope.enableSearchDateBtnForIp = 0;


    $scope.init = function () {
        $scope.action = 1;
        $scope.show = 0;
        $scope.NOIP = 0;
        $scope.NOOP = 0;
        $scope.tempDateModelFromDate = new Date();
        $scope.tempDateModelToDate = new Date();
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
                $scope.unit_data = res.data;
                //console.log($scope.unit_data);
                if(Array.isArray($scope.unit_data)){
                    $scope.NOOP = 0;
                } else {
                    $scope.unit_data = [];
                    $scope.NOOP = 1;
                }
            });
        $http.get("../php/patient_info.php?action=active_ip_visits").then(function OnSuccess(res){
                $scope.unit_ip_data = res.data;
                //console.log($scope.unit_ip_data);
                if(Array.isArray($scope.unit_ip_data)){
                    $scope.NOIP = 0;
                    for(var i in $scope.unit_ip_data){
                        $scope.unit_ip_data[i].total_package_amount = Number($scope.unit_ip_data[i].total_package_amount );
                    }
                } else{
                    $scope.NOIP = 1;
                    $scope.unit_ip_data = [];
                }
            });
        // $scope.date = new Date();
        // $scope.collection.transaction_date = $scope.date.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        var temp = {};
        if ($scope.collection.paid_details.length == 0)
            $scope.collection.paid_details.push(temp);
        if ($scope.lab_billing.test.length == 0)
            $scope.lab_billing.test.push(temp);
        $medwiseLog.save('Users', 'extra Data');
        $("#collection-nav").css("border-bottom", "1px solid blue");
    }
    
    $scope.byDate = function()
        {
            $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
            $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
                $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
                    $scope.unit_data = res.data;
                    //console.log($scope.unit_data);
                    if(Array.isArray($scope.unit_data))
                        {
                            $scope.NOOP = 0;
                        } else {
                            $scope.unit_data = [];
                            $scope.NOOP = 1;
                        }
                });

                // $http.get("../php/patient_info.php?action=specificdate_ip_visits&ip_date="+$scope.changeDate).then(function OnSuccess(res){
                //     $scope.unit_ip_data = res.data;
                //     if(!Array.isArray($scope.unit_ip_data)){
                //         $scope.diss=3;
                //     }else{
                //         $scope.diss=1;
                //     }
                //     //console.log($scope.unit_ip_data);
                // });

            $medwiseLog.save('Date Change','');
        }

        $scope.op_details=function(vid){
            $http.get("../php/patient_info.php?action=specific_visit&visit_id=" + vid).then(function OnSuccess(res){
                    $scope.get_opdetails = res.data;
                    //console.log($scope.get_opdetails);
                });
            // $scope.pn=$scope.get_opdetails[0].name;
        }


        $scope.change_from_date_for_ip = function(from_date_model_for_ip){
            var temp = new Date(from_date_model_for_ip);
                $scope.from_date_for_ip = temp.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric' });
                if($scope.from_date_model_for_ip !== undefined && $scope.to_date_model_for_ip !== undefined){
                $scope.enableSearchDateBtnForIp = 1;
            }
        }
 
		$scope.change_to_date_for_ip = function(to_date_model_for_ip){
            var temp = new Date(to_date_model_for_ip);
                $scope.to_date_for_ip = temp.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric' });
                if($scope.from_date_model_for_ip !== undefined && $scope.to_date_model_for_ip !== undefined){
                $scope.enableSearchDateBtnForIp = 1;
            }
        }   

		$scope.getIP = function(){
			$http.get("../php/patient_info.php?action=specificdate_ip_visits&from_date="+ $scope.from_date_for_ip + "&to_date="+ $scope.to_date_for_ip).then(function OnSuccess(res){
                $scope.unit_ip_data = res.data;
                //console.log($scope.unit_ip_data);
                if(Array.isArray($scope.unit_ip_data)){
                    $scope.NOIP = 0;
                    for(var i in $scope.unit_ip_data){
                        $scope.unit_ip_data[i].total_package_amount = Number($scope.unit_ip_data[i].total_package_amount );
                    }
                } else{
                    $scope.NOIP = 1;
                    $scope.unit_ip_data = [];
                }
            });

		}


        $scope.send_Idssss = function(p_id,v_id,d_id){
            //alert('Doctor Id = ' + d_id);
            $window.sessionStorage.setItem('patient_id',p_id);
            $window.sessionStorage.setItem('p_visit_id',v_id);
            $window.sessionStorage.setItem('dr_id',d_id);
            //alert($window.sessionStorage);
			$location.path("inpatient");
        }

    $scope.print_op = function(vid)
        {
			$http.get("../php/patient_info.php?action=specific_visit&visit_id=" + vid).then(function OnSuccess(res){
            $scope.get_opdetails_for_print=res.data;
            //console.log($scope.get_opdetails_for_print);
            });

            $http.get("../php/hospital.php?action=get_main_hospital_details").then(function OnSuccess(res){
                $scope.hospital_details = res.data;
                //console.table($scope.hospital_details);
            });
        }

    $scope.DeleteOP = function(p_visit_id){
        $http.get("../php/patient_info.php?action=delete&p_visit_id=" +p_visit_id).then(function OnSuccess(res){
            //console.log(res.data);
            $route.reload();
        });
    }

    $scope.specific_ip_detailsFun=function(vid)
        {

            $http.get("../php/patient_info.php?action=specific_ip_visit&visit_id=" + vid).then(function OnSuccess(res)
            {
            $scope.specific_ip_details = res.data;
            //console.log($scope.specific_ip_details);
            });
            //$scope.pn=$scope.specific_ip_details[0].name;
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
        } else {
            $scope.medunits_data = [];
        }
    }


    $scope.ShowInvestigations= function(ind)
    {
        $scope.lab_billing.test = [];
        for(var z in $scope.inpatientInvestigations[ind].investigationsPerformed){
            $scope.lab_billing.test.push($scope.inpatientInvestigations[ind].investigationsPerformed[z]);
        }

        for(var i in $scope.inpatientInvestigations[ind].investigationsPerformed){
            //console.log($scope.inpatientInvestigations[ind].investigationsPerformed);
            $scope.lab_billing.test.push();
            for(var j in $scope.test_data) {
                if($scope.inpatientInvestigations[ind].investigationsPerformed[i].test_id == $scope.test_data[j].test_id) {
                    $scope.lab_billing.test[i].obj = $scope.test_data[j];
                    $scope.lab_billing.test[i].paid_amount = $scope.test_data[j].price;
                    $scope.lab_billing.test[i].test_id = $scope.test_data[j].test_id;
                    $scope.lab_billing.test[i].test_name = $scope.test_data[j].test_name;
                    //$scope.lab_billing.test[i].ref_values = JSON.parse($scope.test_data[j].ref_values);
                }
            }
        }
        $scope.get_paid_amount_for_biiling();
    }

    $scope.ShowPrescription = function(ind){
        $scope.pharmacy_lab_billing.Arr = [];
        for(var j in $scope.inpatientPrescriptions[ind].prescribedMedication){
            $scope.pharmacy_lab_billing.Arr.push($scope.inpatientPrescriptions[ind].prescribedMedication[j]);
        }
        //console.log($scope.pharmacy_lab_billing.Arr);

        //console.log$scope.inpatientPrescriptions[ind].prescribedMedication);
        for(var i in $scope.inpatientPrescriptions[ind].prescribedMedication) {
            var data = {};
            var expiry_date, flag;

            flag = false;
            for(var j in $scope.medunits_data) {
                if($scope.inpatientPrescriptions[ind].prescribedMedication[i].med_id == $scope.medunits_data[j].med_id) {
                    if(flag === false) {
                        expiry_date = new Date($scope.medunits_data[j].expiry_date);
                        data = $scope.medunits_data[j];
                    } else {
                        if(expiry_date > new Date($scope.medunits_data[j].expiry_date)) {
                            expiry_date = new Date($scope.medunits_data[j].expiry_date);
                            data = $scope.medunits_data[j];
                        }
                    }
                    flag = true;
                }
            }

            if(Number(data.quantity) > 0) {
                $scope.pharmacy_lab_billing.Arr[i].obj = data;

                if(Number($scope.inpatientPrescriptions[ind].prescribedMedication[i].quantity) <= Number(data.quantity)) {
                    $scope.pharmacy_lab_billing.Arr[i].quantity = $scope.inpatientPrescriptions[ind].prescribedMedication[i].quantity;
                    $scope.pharmacy_lab_billing.Arr[i].medicine_stock_id = data.medicine_stock_id;
                    $scope.pharmacy_lab_billing.Arr[i].purchase_price = data.purchase_price;
                } else {
                    $scope.pharmacy_lab_billing.Arr[i].quantity = data.quantity;
                    $scope.pharmacy_lab_billing.Arr[i].medicine_stock_id = data.medicine_stock_id;
                    $scope.pharmacy_lab_billing.Arr[i].purchase_price = data.purchase_price;
                }
            }

        }


        $scope.pharmacy_lab_billing.total_amount = 0;
        $scope.show_pharmacy_total = 1;
        for (var i in $scope.pharmacy_lab_billing.Arr) {
            $scope.pharmacy_lab_billing.Arr[i].price = Number($scope.pharmacy_lab_billing.Arr[i].quantity)* Number($scope.pharmacy_lab_billing.Arr[i].obj.price);
            $scope.pharmacy_lab_billing.total_amount = $scope.pharmacy_lab_billing.total_amount + Number($scope.pharmacy_lab_billing.Arr[i].quantity)* Number($scope.pharmacy_lab_billing.Arr[i].obj.price);
        }
        //console.log($scope.pharmacy_lab_billing.total_amount);
        $scope.pharmacy_add_btn_disable = 0;
    }

    $scope.change_qty_for_pharmacy = function(ind ,val){
        if($scope.pharmacy_lab_billing.Arr[ind].med_id == undefined){
            swal('Select Medicine First');
            $scope.pharmacy_lab_billing.Arr[ind].quantity = '';
            return;
        }
        if(Number($scope.pharmacy_lab_billing.Arr[ind].obj.quantity) < Number(val)){
            swal('Quantity Not To Be More Then Previous Quantity');
            $scope.pharmacy_lab_billing.Arr[ind].req_qty = $scope.pharmacy_lab_billing.Arr[ind].obj.quantity;
        }
        $scope.pharmacy_lab_billing.Arr[ind].price = val * $scope.pharmacy_lab_billing.Arr[ind].obj.price;
        $scope.pharmacy_lab_billing.total_amount = 0;
        $scope.show_pharmacy_total = 1;
        for (var i in $scope.pharmacy_lab_billing.Arr) {
            if ($scope.pharmacy_lab_billing.Arr[i].price != undefined) {
                $scope.pharmacy_add_btn_disable = 0;
                $scope.pharmacy_lab_billing.total_amount = Number($scope.pharmacy_lab_billing.total_amount) + Number($scope.pharmacy_lab_billing.Arr[i].price);
            } else {
                $scope.pharmacy_add_btn_disable = 1;
            }
        }
    }

    $scope.select_bil_category_for_selection_of_test = function (obj, ind) {
        $scope.lab_billing.test[ind].test_id = obj.test_id;
        $scope.lab_billing.test[ind].test_name = obj.test_name;
        $scope.lab_billing.test[ind].paid_amount = obj.price;
        $scope.lab_billing.test[ind].ref_values = JSON.parse(obj.ref_values);
        $scope.get_paid_amount_for_biiling();
    }

    $scope.remove_for_lab_billing = function (ind) {
        $scope.lab_billing.test.splice(ind, 1);
        $scope.get_paid_amount_for_biiling();
    }

    $scope.remove_for_lab_billing_pharmacy = function (ind) {
        $scope.pharmacy_lab_billing.Arr.splice(ind, 1);
        $scope.pharmacy_lab_billing.total_amount = 0;
        for (var i in $scope.pharmacy_lab_billing.Arr) {
            if ($scope.pharmacy_lab_billing.Arr[i].med_id != undefined) {
                $scope.show_total_for_bill = 1;
                $scope.pharmacy_lab_billing.total_amount = ($scope.pharmacy_lab_billing.total_amount) + Number($scope.pharmacy_lab_billing.Arr[i].price);
            }
        }
        $scope.pharmacy_add_btn_disable = 0;
    }

    $scope.add = function () {
        var temp = {};
        $scope.collection.paid_details.push(temp);
        for (var t in $scope.collection.paid_details) {
            if ($scope.collection.paid_details[t].paid_amount !== undefined) {
                $scope.addBtnDisable = 'no';
            } else {
                $scope.addBtnDisable = 'yes';
                break;
            }
        }
    }

    $scope.select_medicine_for_pharmacy_lab_billing = function(obj,ind){
        $scope.pharmacy_lab_billing.Arr[ind].med_id = obj.med_id;
        $scope.pharmacy_lab_billing.Arr[ind].medicine_stock_id = obj.medicine_stock_id;
        $scope.pharmacy_lab_billing.Arr[ind].purchase_price = obj.purchase_price;

        $scope.pharmacy_lab_billing.total_paid_amount = 0;
        for (var i in $scope.lab_billing.test) {
            if ($scope.pharmacy_lab_billing.Arr[i].med_id !== undefined) {
                $scope.show_total_for_bill = 1;
                $scope.pharmacy_lab_billing.total_paid_amount = Number($scope.pharmacy_lab_billing.total_paid_amount) + Number($scope.pharmacy_lab_billing.Arr[i].paid_amount);
                if ($scope.addBtnDisable_for_bill !== 'yes') {
                    $scope.addBtnDisable_for_bill = 'no';
                }
            } else {
                $scope.addBtnDisable_for_bill = 'yes';
            }
        }
        $scope.pharmacy_lab_billing.Arr[ind].req_qty = 0;
        $scope.pharmacy_lab_billing.Arr[ind].price = 0;
        $scope.pharmacy_lab_billing.total_amount = 0;
        for (var i in $scope.pharmacy_lab_billing.Arr) {
            if ($scope.pharmacy_lab_billing.Arr[i].price != undefined) {
                $scope.pharmacy_add_btn_disable = 0;
                $scope.pharmacy_lab_billing.total_amount = Number($scope.pharmacy_lab_billing.total_amount) + Number($scope.pharmacy_lab_billing.Arr[i].price);
            }
        }
    }

    $scope.add_for_lab_billing = function () {
        var temp = {};
        $scope.lab_billing.test.push(temp);
        $scope.addBtnDisable_for_bill = 'yes';
        // for (var t in $scope.collection.test) {
        //     if ($scope.lab_billing.test[t].test_id !== undefined) {
        //         $scope.addBtnDisable_for_bill = 'no';
        //     } else {
        //         $scope.addBtnDisable_for_bill = 'yes';
        //         break;
        //     }
        // }
    }


    $(document).ready(function(){
        $("#lab_billing_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
    });
    $scope.changeDate_Through_UiJquery = function(lab_billing_date){
        $scope.lab_billing.transaction_date = lab_billing_date;
    }

    $(document).ready(function(){
        $("#transaction_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
    });
    $scope.changeDate_Through_UiJquery_for_pharmacy = function(transaction_date){
        $scope.pharmacy_lab_billing.transaction_date = transaction_date;
    }

    $scope.select_bil_category_for_lab_billing_for_main_obj = function (obj) {
        $scope.lab_billing.bill_id = obj.bcid;
    }

    $scope.get_detailsByRecCode = function (receipt_code) {
        $http.get("../php/collection.php?action=get_receipt_details&receipt_code=" + receipt_code).then(function OnSuccess(res) {
            $scope.indivisual_receipt = res.data;
            $scope.total = 0;
            for(var i in $scope.indivisual_receipt){
                for(var j in $scope.indivisual_receipt[i].paid_details){
                    $scope.indivisual_receipt[i].paid_details[j].amount = Number($scope.indivisual_receipt[i].paid_details[j].amount);
                }
            }
            //console.table($scope.indivisual_receipt);
        });
    }

    $scope.get_paid_amount = function () {
        $scope.addBtnDisable = 'no';
        $scope.collection.total_paid_amount = 0;
        for (var i in $scope.collection.paid_details) {
            if ($scope.collection.paid_details[i].paidAmount != undefined) {
                $scope.show_total = 1;
                $scope.collection.total_paid_amount = Number($scope.collection.total_paid_amount) + Number($scope.collection.paid_details[i].paidAmount);
                if ($scope.addBtnDisable !== 'yes') {
                    $scope.addBtnDisable = 'no';
                }
            } else {
                $scope.addBtnDisable = 'yes';
            }
        }
    }


    $scope.get_paid_amount_for_biiling = function () {
        $scope.addBtnDisable_for_bill = 'no';
        $scope.lab_billing.total_paid_amount = 0;
        //console.log($scope.lab_billing.test);
        for (var i in $scope.lab_billing.test) {
            if ($scope.lab_billing.test[i].test_id !== undefined) {
                $scope.show_total_for_bill = 1;
                $scope.lab_billing.total_paid_amount = Number($scope.lab_billing.total_paid_amount) + Number($scope.lab_billing.test[i].paid_amount);
                if ($scope.addBtnDisable_for_bill !== 'yes') {
                    $scope.addBtnDisable_for_bill = 'no';
                }
            } else {
                $scope.addBtnDisable_for_bill = 'yes';
            }
        }
    }

    $scope.change_amount_for_pharmacy = function(ind, val){

        if($scope.pharmacy_lab_billing.Arr[ind].med_id == undefined){
            swal('Select Medicine First');
            $scope.pharmacy_lab_billing.Arr[ind].price = '';
            return;
        }
        if(Number($scope.pharmacy_lab_billing.Arr[ind].obj.price) < Number(val)){
                swal('Price Not To Be More Then Previous Price');
                $scope.pharmacy_lab_billing.Arr[ind].price = $scope.pharmacy_lab_billing.Arr[ind].obj.price;
            }
        $scope.pharmacy_lab_billing.total_amount = 0;
        for (var i in $scope.pharmacy_lab_billing.Arr) {
            if ($scope.pharmacy_lab_billing.Arr[i].price != undefined) {
                $scope.pharmacy_add_btn_disable = 0;
                $scope.pharmacy_lab_billing.total_amount = Number($scope.pharmacy_lab_billing.total_amount) + Number($scope.pharmacy_lab_billing.Arr[i].price);
            } else {
                $scope.pharmacy_add_btn_disable = 1;
            }
        }
    }


    $scope.select_hospital = function (obj) {
        $scope.collection.hospital_id = obj.hid;
    }



    $scope.remove = function (ind) {
        $scope.collection.paid_details.splice(ind, 1);
        $scope.get_paid_amount();
    }

    $scope.search_data = function (temp) {
        if ($scope.search == '' || $scope.search == undefined) {
            swal("Type Patient Name To Search a Patient");
        } else {
            $http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
                $scope.collection_data = res.data;
                //console.table($scope.collection_data);
                if (!Array.isArray($scope.collection_data)) {
                    $scope.show = 0;
                } else {
                    $scope.collection_data = [];
                    $scope.show = 1;
                }
            });
            $scope.search = '';
        }
    }


    $scope.autosearch_data = function (temp) {
        // console.log(temp);
        $http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
            $scope.collection_data = res.data;
            //console.table(res.data);
            //console.table($scope.coll$scope.collection_dataection_data);
            if (!Array.isArray($scope.collection_data)) {
                $scope.collection_data = [];
                $scope.show = 0;
            } else {
                $scope.show = 1;
            }
        });
        $scope.search = '';
    }

    $scope.move = function (patient_id) {
        $scope.tempDateModel = new Date();
        $scope.collection.transaction_date = $scope.tempDateModel.toLocaleDateString('en-US' , {day:'2-digit', month: 'long', year: 'numeric'});
        $scope.lab_billing.transaction_date = $scope.tempDateModel.toLocaleDateString('en-US' , {day:'2-digit', month: 'long', year: 'numeric'});
        $scope.pharmacy_lab_billing.transaction_date = $scope.tempDateModel.toLocaleDateString('en-US' , {day:'2-digit', month: 'long', year: 'numeric'});

        $scope.loadFinalBill = false;
        $http.get("../php/patient_info.php?action=patient_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.patient_details = res.data;
            //console.table($scope.patient_details)
        });

        $http.get("../php/collection.php?action=get_latest_visit&patient_id=" + patient_id).then(function OnSuccess(res) {
            //console.log($scope.patient_visit_details);
            $scope.patient_visit_details = res.data;
            $scope.p_v_id = res.data[0].p_visit_id;
            $scope.Type = res.data[0].patient_type;
            $scope.isBillSettled = res.data[0].isBillSettled;
                $http.get("../php/collection.php?action=get_paid_amount&p_visit_id=" + $scope.patient_visit_details[0].p_visit_id).then(function OnSuccess(res) {
                    $scope.totalPaidAmount = Number(res.data[0].paid_amount);
                });
                if($scope.Type == 'In Patient')
                {
                    $http.get("../php/case_sheet.php?action=get_investigations_list_for_visit&visit_id="+$scope.p_v_id).then(function OnSuccess(res){
                        //console.table(res.data);
                        var isAnyRecord = false;
                        if(Array.isArray(res.data)) {
                            for(var i in res.data) {
                                if(JSON.parse(res.data[i].investigationsPerformed) !== null) {
                                    res.data[i].investigationsPerformed = JSON.parse(res.data[i].investigationsPerformed);
                                    isAnyRecord = true;
                                }
                            }
                            if(isAnyRecord === true) {
                                $scope.inpatientInvestigations = res.data;
                            } else {
                                $scope.inpatientInvestigations = [];
                                $scope.showNoInvestigations = false;
                            }
                        } else {
                            $scope.inpatientInvestigations = [];
                            $scope.showNoInvestigations = false;
                        }
                        //console.log($scope.inpatientInvestigations);
                    });
                    $http.get("../php/case_sheet.php?action=get_prescriptions_list_for_visit&visit_id="+$scope.p_v_id).then(function OnSuccess(res){
                        //console.log(res.data);
                        if(Array.isArray(res.data)) {
                            for(var i in res.data) {
                                res.data[i].prescribedMedication = JSON.parse(res.data[i].prescribedMedication);
                            }
                            $scope.inpatientPrescriptions = res.data;
                        } else {
                            $scope.inpatientPrescriptions = [];
                            $scope.showNoPrescriptions = true;
                        }
                        //console.log($scope.inpatientPrescriptions);
                    });
                }

                $scope.collection.patient_id = patient_id;
                $scope.collection.p_visit_id = $scope.patient_visit_details[0].p_visit_id;
                $scope.collection.dr_id = $scope.patient_visit_details[0].doctor_id;
                $scope.collection.user_id = $scope.login_data.edwise['uid'];

                $scope.lab_billing.patient_id = patient_id;
                $scope.lab_billing.patient_type = $scope.Type;
                $scope.lab_billing.p_visit_id = $scope.patient_visit_details[0].p_visit_id;
                $scope.lab_billing.dr_id = $scope.patient_visit_details[0].doctor_id;
                $scope.lab_billing.user_id = $scope.login_data.edwise['uid'];

                $scope.pharmacy_lab_billing.patient_id = patient_id;
                $scope.pharmacy_lab_billing.p_visit_id = $scope.patient_visit_details[0].p_visit_id;
                $scope.pharmacy_lab_billing.dr_id = $scope.patient_visit_details[0].doctor_id;
                $scope.pharmacy_lab_billing.user_id = $scope.login_data.edwise['uid'];
            });

        $http.get("../php/patient_info.php?action=previous_visit_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.pre_visit_details = res.data;
            //console.table($scope.pre_visit_details);
            if(Array.isArray($scope.pre_visit_details)){
                $scope.NoDataForVisit = 0;
            } else {
                $scope.NoDataForVisit = 1;
            }
        });
        $http.get("../php/patient_info.php?action=previous_bill_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.pre_bills_details = res.data;
            if(Array.isArray($scope.pre_bills_details)){
                $scope.NoData = 0;
            }else{
                $scope.NoData = 1;
            }
            //console.table($scope.pre_bills_details);
        });
        $http.get("../php/bill_category.php?action=get_general_bill_categories").then(function OnSuccess(res) {
            $scope.bill_cateories = res.data;
            //console.table($scope.bill_cateories);
        });
        // $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res) {
        //     $scope.doctors = res.data;
        //     //console.log($scope.doctors);
        // });
        $http.get("../php/hospital.php?action=select").then(function OnSuccess(res) {
            $scope.hospital = res.data;
            //console.table($scope.hospital);
        });
        $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res) {
            $scope.test_data = res.data;
            if(!Array.isArray($scope.test_data)) {
                $scope.test_data = [];
            }
            //console.table($scope.test_data);
        });
        // $http.get("../php/medicine_stock_register.php?action=get_medicines_stock_list").then(function OnSuccess(res) {
        //     $scope.medunits_data = res.data;
        //     if(!Array.isArray($scope.medunits_data)) {
        //         $scope.medunits_data = [];
        //     }
        //     //console.table($scope.medunits_data);
        // });
        if($scope.pharmacy_lab_billing.Arr.length == 0){
            var obj = {};
            $scope.pharmacy_lab_billing.Arr.push(obj);
        }
        //alert($scope.pharmacy_lab_billing.Arr[0].amount == undefined);
        $scope.action = 2;
    }

    $scope.loadFinalBillSettlement = function(patientId, visitId) {

        $scope.visitIdForDischargePatient = visitId;
        $scope.patientIdForDischargePatient = patientId;
        $scope.totalRoomAmount = 0;
        $scope.totalDoctorVisitAmount = 0;
        $scope.labInvestigationsAmount = 0;
        $scope.totalDueAmountOfVisit = 0;
        $scope.investigationsThere = false;
        $scope.dischargeDateOfVisit = new Date();
        $scope.discountAmountOfVisit = 0;
        $scope.labTestAmount = 0;

        $http.get("../php/final_billing.php?action=getRoomDetailsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
            $scope.roomDetailsOfVisit = res.data;

            if(!Array.isArray($scope.roomDetailsOfVisit)) {
                $scope.roomDetailsOfVisit = [];
            }
            //console.log($scope.roomDetailsOfVisit);

            $scope.reloadVacatedDates();
            $scope.calcTotalRoomAmount();
        });

        $http.get("../php/final_billing.php?action=getAllDoctorDetailsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
            $scope.visitedDoctorDetails = res.data;
            //console.log($scope.visitedDoctorDetails);

            if(!Array.isArray($scope.visitedDoctorDetails)) {
                $scope.visitedDoctorDetails = [];
            }
            $scope.cumulativeDoctorVisitsArray = [];
            for(var i in $scope.visitedDoctorDetails) {

                var isDoctorVisitCounted = false;
                for(var k in $scope.cumulativeDoctorVisitsArray) {
                    if($scope.cumulativeDoctorVisitsArray[k].visitedDoctor === $scope.visitedDoctorDetails[i].visitedDoctor && $scope.cumulativeDoctorVisitsArray[k].consultationType === $scope.visitedDoctorDetails[i].consultationType) {
                        isDoctorVisitCounted = true;
                    }
                }

                if(!isDoctorVisitCounted) {
                    var count = 1;
                    for(var j in $scope.visitedDoctorDetails) {

                        if(i !== j) {
                            if($scope.visitedDoctorDetails[i].visitedDoctor === $scope.visitedDoctorDetails[j].visitedDoctor && $scope.visitedDoctorDetails[i].consultationType === $scope.visitedDoctorDetails[j].consultationType) {
                                count++;
                            }
                        }
                    }

                    $scope.visitedDoctorDetails[i].count = count;
                    $scope.cumulativeDoctorVisitsArray.push($scope.visitedDoctorDetails[i]);
                }
            }

            $scope.calcTotalDoctorVisitAmount();

            //console.log($scope.cumulativeDoctorVisitsArray);
        });

        $http.get("../php/final_billing.php?action=getLabTestsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
            //console.log(res.data);
            $scope.testDetailsOfVisit = res.data;

            if(!Array.isArray($scope.testDetailsOfVisit)) {
                $scope.testDetailsOfVisit = [];
            }

            for(var i in $scope.testDetailsOfVisit) {
                $scope.testDetailsOfVisit[i].investigationsPerformed = JSON.parse($scope.testDetailsOfVisit[i].investigationsPerformed);

                var visitInvestigationsAmount = 0;
                for(var j in $scope.testDetailsOfVisit[i].investigationsPerformed) {
                    if($scope.testDetailsOfVisit[i].investigationsPerformed[j] !== null) {
                        //console.log($scope.testDetailsOfVisit[i].investigationsPerformed[j]);
                        if(Number($scope.testDetailsOfVisit[i].investigationsPerformed[j].price) > 0) {
                            $scope.investigationsThere = true;
                        }
                        visitInvestigationsAmount += Number($scope.testDetailsOfVisit[i].investigationsPerformed[j].price);
                    }
                }

                $scope.testDetailsOfVisit[i].visitInvestigationsAmount = visitInvestigationsAmount;
                $scope.labInvestigationsAmount += $scope.testDetailsOfVisit[i].visitInvestigationsAmount;
            }

            //console.log($scope.testDetailsOfVisit);

            // for(var j in $scope.testDetailsOfVisit) {

            // }
            //console.log($scope.testDetailsOfVisit);
        });


        $http.get("../php/final_billing.php?action=getPaidDetailsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
            //console.log(res.data);
            $scope.paidDetailsOfVisit = res.data;

            $scope.totalPaidAmountOfVisit = 0;
            for(var i in $scope.paidDetailsOfVisit) {
                if($scope.paidDetailsOfVisit[i] !== null) {
                    $scope.totalPaidAmountOfVisit += Number($scope.paidDetailsOfVisit[i].amount);
                }
            }

            // for(var j in $scope.testDetailsOfVisit) {

            // }
            //console.log($scope.testDetailsOfVisit);
        });


        $scope.loadFinalBill = true;
    }

    $scope.calcTotalRoomAmount = function() {

        $scope.totalRoomAmount = 0;
        for(var i in $scope.cumulativeRoomsArray) {
            if($scope.cumulativeRoomsArray[i].noOfDays !== undefined) {
                $scope.totalRoomAmount += Number($scope.cumulativeRoomsArray[i].roomRentAmount) * Number($scope.cumulativeRoomsArray[i].noOfDays);
            }
        }
    }

    $scope.calcTotalDoctorVisitAmount = function() {
        $scope.totalDoctorVisitAmount = 0;
        for(var i in $scope.cumulativeDoctorVisitsArray) {
            if($scope.cumulativeDoctorVisitsArray[i].count !== undefined) {
                $scope.totalDoctorVisitAmount += Number($scope.cumulativeDoctorVisitsArray[i].amount) * Number($scope.cumulativeDoctorVisitsArray[i].count);
            }
        }
    }


    $scope.calcTotalInvestigationsAmount = function() {

        $scope.labInvestigationsAmount = 0;
        for(var i in $scope.testDetailsOfVisit) {
            if($scope.testDetailsOfVisit[i].visitInvestigationsAmount !== undefined) {
                $scope.labInvestigationsAmount += Number($scope.testDetailsOfVisit[i].visitInvestigationsAmount);
            }
        }
    }

    $scope.reloadVacatedDates = function() {

        $scope.dischargeDateOfVisitForDb = $scope.dischargeDateOfVisit.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric", hour: "2-digit", minute: "2-digit", second: "2-digit", hour12: false });

        $scope.cumulativeRoomsArray = [];
        for(var i in $scope.roomDetailsOfVisit) {

            var isRoomCounted = false;
            for(var k in $scope.cumulativeRoomsArray) {
                if($scope.cumulativeRoomsArray[k].bedId === $scope.roomDetailsOfVisit[i].bedId) {
                    isRoomCounted = true;
                }
            }

            if(!isRoomCounted) {

                if($scope.roomDetailsOfVisit[i].vacatedDate === null) {
                    var enteredDate = new Date($scope.roomDetailsOfVisit[i].enteredDate);
                    var vacatedDate = new Date($scope.dischargeDateOfVisit);

                    var enteredDateTimeStamp = enteredDate.getTime();
                    var vacatedDateTimeStamp = vacatedDate.getTime();

                    var timeStampDifference = Math.abs(enteredDateTimeStamp - vacatedDateTimeStamp);
                    var differenceInDays = Math.ceil(timeStampDifference / (3600 * 24 * 1000));

                    if(differenceInDays === 0) {
                        differenceInDays++;
                    } else {
                        differenceInDays--;
                    }

                    noOfDays = Number(differenceInDays);
                } else {
                    noOfDays = Number($scope.roomDetailsOfVisit[i].noOfDays);
                }

                for(var j in $scope.roomDetailsOfVisit) {

                    if(i !== j) {
                        if($scope.roomDetailsOfVisit[i].bedId === $scope.roomDetailsOfVisit[j].bedId) {
                            if($scope.roomDetailsOfVisit[j].vacatedDate !== null) {
                                noOfDays += Number($scope.roomDetailsOfVisit[j].noOfDays);
                            } else {
                                var enteredDate = new Date($scope.roomDetailsOfVisit[j].enteredDate);
                                var vacatedDate = new Date($scope.dischargeDateOfVisit);

                                var enteredDateTimeStamp = enteredDate.getTime();
                                var vacatedDateTimeStamp = vacatedDate.getTime();

                                var timeStampDifference = Math.abs(enteredDateTimeStamp - vacatedDateTimeStamp);
                                var differenceInDays = Math.ceil(timeStampDifference / (3600 * 24 * 1000));

                                if(differenceInDays === 0) {
                                    differenceInDays++;
                                } else {
                                    differenceInDays--;
                                }

                                noOfDays += Number(differenceInDays);
                            }
                        }
                    }
                }

                $scope.roomDetailsOfVisit[i].noOfDays = noOfDays;
                $scope.cumulativeRoomsArray.push($scope.roomDetailsOfVisit[i]);
            }
        }
    }


    $scope.showBreakUpsOfRoom = function(bedId) {

        $scope.bedIdForDetailsModal = bedId;

        $('#modalToggleButton').attr("data-toggle", "modal");
        $('#modalToggleButton').attr("data-target", "#roomDetailsOfVisitModal");
        $('#modalToggleButton').trigger("click");
    }

    $scope.showBreakUpsOfDoctor = function(drId, consultationType) {

        $scope.doctorIdForDetailsModal = drId;
        $scope.consultationTypeForDetailsModal = consultationType;

        $('#modalToggleButton').attr("data-toggle", "modal");
        $('#modalToggleButton').attr("data-target", "#doctorDetailsOfVisitModal");
        $('#modalToggleButton').trigger("click");
    }

    $scope.showBreakUpsOfInvestigations = function() {
    }

    $scope.assignDiscountAmount = function(value) {
        $scope.discountAmountOfVisit = value;
    }


    $scope.saveFinalSettlementBillData = function() {

        var data = $.param({
            roomDetailsOfVisit: $scope.cumulativeRoomsArray,
            doctorDetailsOfVisit: $scope.cumulativeDoctorVisitsArray,
            visitId: $scope.visitIdForDischargePatient,
            patientId: $scope.patientIdForDischargePatient,
            investigationChargeOfVisit: $scope.labInvestigationsAmount,
            dischargeDate: $scope.dischargeDateOfVisitForDb,
            discountAmountOfVisit: $scope.discountAmountOfVisit,
            userId: $scope.login_data.edwise.uid
        });
        var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };

        $http.post("../php/discharge_summary.php?action=addFinalSettlement", data, config).then(function OnSuccess(res, status, header, config) {
            //console.log(res.data);
            $route.reload();
        });
    }

    $scope.select_bil_category = function (obj, ind) {
        $scope.collection.paid_details[ind].bill_id = obj.bcid;
    }



    $scope.add_for_lab_billing_pharmacy = function(ind){
        var obj = {};
        $scope.pharmacy_lab_billing.Arr.push(obj);
        $scope.pharmacy_add_btn_disable = 1;
    }

    $scope.save_visit_data = function () {

        //$scope.date = new Date();
        //$scope.collection.transaction_date = $scope.date.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });


        for (var i in $scope.collection.paid_details) {
            if ($scope.collection.paid_details[i].bill_id == undefined || $scope.collection.paid_details[i].bill_id == '') {
                swal("Select Bill Category");
                return;
            }
        }
        var data = $.param({
            collection_data: $scope.collection
        });
        var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        $http.post("../php/collection.php?action=add", data, config).then(function OnSuccess(res, status, header, config) {
            $scope.receipt_data = res.data;
            //console.table($scope.receipt_data);
            for(var i in $scope.receipt_data){
                for(var j in $scope.receipt_data[i].paid_details){
                    $scope.receipt_data[i].paid_details[j].amount = Number($scope.receipt_data[i].paid_details[j].amount);
                }
            }
            //console.table($scope.receipt_data);
            $scope.action = 3;
            // $('#modalToggleButton').attr("data-toggle", "modal");
            // $('#modalToggleButton').attr("data-target", "#BillID");
            // $('#modalToggleButton').trigger("click");
        });
        $medwiseLog.save('Collection', data);
    }


    $scope.save_lab_billing_data = function() {
        for(var i in $scope.lab_billing.test)
            if($scope.lab_billing.test[i].test_id == undefined){
                swal("Select Test");
                return;
            }
            for(var j in $scope.lab_billing.test){
                delete $scope.lab_billing.test[j].obj;
            }
            var data = $.param({
                lab_billing_data : $scope.lab_billing
            });
            //console.log($scope.lab_billing);
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            $http.post("../php/collection.php?action=add_test_lab_billing",data,config).then(function OnSuccess(res,status,header,config){
                $scope.receipt = res.data;
                //console.log($scope.receipt);
                $scope.action = 4;
                // $('#modalToggleButton').attr("data-toggle", "modal");
                // $('#modalToggleButton').attr("data-target", "#lab_billingID");
                // $('#modalToggleButton').trigger("click");
                //$route.reload();
            });
            //$medwiseLog.save('Users','extra Data');
    };

    $scope.save_pharmacy_billing_data = function(){
        for(var i in $scope.pharmacy_lab_billing.Arr){
            if($scope.pharmacy_lab_billing.Arr[i].med_id == undefined){
                swal('Select Medicine');
                return;
            }
        }
            var data = $.param({ pharmacy_billing : $scope.pharmacy_lab_billing });
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
            $http.post("../php/collection.php?action=add_pharmacy_billing", data, config).then(function OnSuccess(res, status, header, config){
            //console.log(res.data);
            $scope.pharmacy_bills = res.data;
            //console.log($scope.pharmacy_bills);
            $scope.action = 5;
            // $('#modalToggleButton').attr("data-toggle", "modal");
            // $('#modalToggleButton').attr("data-target", "#PharmacyID");
            // $('#modalToggleButton').trigger("click");
        });
    }

    $scope.reloadPage = function () {
        $route.reload();
        $scope.action = 1;
    }


    $(document).ready(function(){
        $("#trans_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
    });
    $scope.changeDate_Through_UiJquery_for_payment = function(trans_date){
        $scope.collection.transaction_date = trans_date;
    }

    $scope.Home = function () {
        $scope.action = 1;
        $scope.temp = new Date();
        $scope.p_date = $scope.temp.toLocaleDateString('en-GB', { day:'numeric', month:'numeric', year:'numeric' });
        $scope.byDate();
        $scope.showTab('#mainmenu1', '#opLink1');
    }

    $scope.ip_print_fun = function (opp)
    {
        $scope.PrintShow = 1;
        var mywindow = window.open('', 'PRINT', 'height=600,width=800');

        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        //mywindow.document.write('</head><body >');
        //mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(opp).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();
        $scope.reloadPage();
        $scope.PrintShow = 0;
        return true;
    }


    $scope.SortTheData = function (temp) {
        $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
        //alert("reverseSort = " + $scope.reverseSort);
        $scope.sort = temp;
    }


    $scope.showTab = function (id, obj) {
        $(".tab-pane").removeClass("in active");
        $(id).addClass("in active");
        $(".nav li").removeClass("active");
        $(obj).parent().addClass("active");
    }

});
