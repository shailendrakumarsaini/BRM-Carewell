angular.module('medwise').controller('casesheet_ctrl', function ($scope, $http, $filter, $window, $route,$location, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.casesheet = {};
    $scope.casesheet.inv_details = [];
    $scope.casesheet.medication_details = [];
    // $scope.casesheet.monitering_details = [];
    $scope.add_btn_disable = 1;
    $scope.add_btn_dis_for_diagnosis = 1;
    $scope.add_btn_dis_for_medication = 1;
    $scope.multipleDemo = {};
    $scope.multipleDemo.medicines = [];
    $scope.medunits_data = [];
    $scope.multipleItem = {};
    $scope.multipleItem.Tests = [];
    $scope.test_data = [];
    $scope.updateCaseSheetUi = {};
    $scope.updateCaseSheetUi.test_id = [];
    $scope.update_casesheet = {};
    $scope.update_casesheet.inv_details = [];
    $scope.updateMultipleDemo = {};
    $scope.updateMultipleDemo.medicines = [];

    $scope.currentParams = $route.current.params;

    console.log($scope.currentParams.patientId);

    $scope.init = function () {
       
        $scope.action = 1;
        $scope.opTypes = [];
        // $http.get("../php/inpatient.php?action=active_ip_visits").then(function OnSuccess(res) {
        //     $scope.casesheet_data = res.data;
        //     console.log($scope.casesheet_data);
        //     if(Array.isArray($scope.casesheet_data)) {
        //         $scope.NoData = 0;
        //     }else{
        //         $scope.NoData = 1;
        //     }
        //     //console.table($scope.casesheet_data);
        // });

        //Get Active Inpatients List
        $http.get("../php/patient_info.php?action=active_ip_visits").then(function OnSuccess(res){
            $scope.inPatientsList = res.data;
            //console.log($scope.inPatientsList);
            if(Array.isArray($scope.inPatientsList)){
                $scope.NOIP = true;
            } else{
                $scope.inPatientsList = [];  
                $scope.NOIP = false;
            } 
        });

        //  if($scope.casesheet.inv_details.length == 0){
        //     $scope.add_inv();
        //  }
        //  if($scope.casesheet.monitering_details.length == 0){
        //     $scope.add_diagnosist();
        //  }
        //  if($scope.casesheet.medication_details.length == 0){
        //     $scope.add_medication();
        // }

        if($scope.currentParams.patientId !== undefined) {
          
            $scope.moveTo($scope.currentParams.patientId, $scope.currentParams.visitId, $scope.currentParams.bedId)
        }
        $medwiseLog.save('Users', 'extra Data');
    }


    $scope.caseSheetHome = function () {
        $scope.casesheet = {};
        $scope.casesheet.inv_details = [];
        $scope.casesheet.medication_details = [];
        // $scope.casesheet.monitering_details = [];
        $scope.add_btn_disable = 1;
        $scope.add_btn_dis_for_diagnosis = 1;
        $scope.add_btn_dis_for_medication = 1;
        $scope.multipleDemo = {};
        $scope.multipleDemo.medicines = [];
        $scope.medunits_data = [];
        $scope.multipleItem = {};
        $scope.multipleItem.Tests = [];
        $scope.test_data = [];
        $scope.updateCaseSheetUi = {};
        $scope.updateCaseSheetUi.test_id = [];
        $scope.update_casesheet = {};
        $scope.update_casesheet.inv_details = [];
        $scope.updateMultipleDemo = {};
        $scope.updateMultipleDemo.medicines = [];
        $scope.ipTypes = [];
        $scope.init();
    }

    $scope.redirectToNewPatientPage = function(){
        $location.path("/newpaitent");
        //  $('#moveToNewPatient').on('click',function(){
        //     alert($scope.action);
        //     $scope.getInpatientsList();
        //  });
    }

    $scope.moveTo = function (patient_id, p_visit_id, bed_id) {
        $scope.today = new Date();
        $scope.patientIdForAll = patient_id;
        $scope.visitIdForAll = p_visit_id;
        $scope.bedIdForAll = bed_id;

        $http.get("../php/case_sheet.php?action=get_previous_counsult_details&visit_id=" + p_visit_id).then(function OnSuccess(res) {
            $scope.dr_visit_details = res.data;
            
            if (Array.isArray($scope.dr_visit_details)) {

                for(var i in $scope.dr_visit_details) {
                    $scope.dr_visit_details[i].inv_details = JSON.parse($scope.dr_visit_details[i].inv_details);
                    $scope.dr_visit_details[i].investigationResults = JSON.parse($scope.dr_visit_details[i].investigationResults);
                    $scope.dr_visit_details[i].medication_details = JSON.parse($scope.dr_visit_details[i].medication_details);
                    $scope.dr_visit_details[i].monitoring = JSON.parse($scope.dr_visit_details[i].monitoring);
                    
                    if($scope.dr_visit_details[i].inv_details === null) {
                        $scope.dr_visit_details[i].is_test_exist = false;
                    } else {
                        $scope.dr_visit_details[i].is_test_exist = true;
                    }

                    if($scope.dr_visit_details[i].medication_details === null) {
                        $scope.dr_visit_details[i].is_medicine_exist = false;
                    } else {
                        $scope.dr_visit_details[i].is_medicine_exist = true;
                    }

                    if(Array.isArray($scope.dr_visit_details[i].investigationResults)) {
                        for(var j in $scope.dr_visit_details[i].investigationResults) {
                            var tempArray = [];

                            //console.log($scope.dr_visit_details[i].investigationResults[j].ref_values[0]);
                            
                            if($scope.dr_visit_details[i].investigationResults[j].ref_values !== undefined) {

                                if($scope.dr_visit_details[i].investigationResults[j].ref_values[0].remarks !== undefined) {

                                    var remarks = $scope.dr_visit_details[i].investigationResults[j].ref_values[0].remarks;
                                } else {
    
                                    var remarks = null;
                                }
                                for(var k in $scope.dr_visit_details[i].investigationResults[j].ref_values) {
                
                                    if(($scope.dr_visit_details[i].investigationResults[j].ref_values[k].Gender === $scope.dr_visit_details[i].gender) || ($scope.dr_visit_details[i].investigationResults[j].ref_values[k].Gender === 'All')) {
                                        
                                        var obj = $scope.dr_visit_details[i].investigationResults[j].ref_values[k];

                                        if(obj.Array !== undefined && !Array.isArray(obj.Array)) {

                                            obj.Array = obj.Array.split(",");

                                            obj.Array = obj.Array.filter(function(value) {
                                                return value.trim();
                                            });
                                        }

                                        if(obj.Description !== undefined && !Array.isArray(obj.Description)) {

                                            obj.Description = obj.Description.split(",");
                
                                            obj.Description = obj.Description.filter(function(value) {
                                                return value.trim();
                                            });
                                        }

                                        tempArray.push(obj);
                                    }
                                }

                                $scope.dr_visit_details[i].investigationResults[j].ref_values = [];
                                $scope.dr_visit_details[i].investigationResults[j].ref_values = tempArray;
            
                                if(remarks !== null && remarks !== '') {

                                    $scope.dr_visit_details[i].investigationResults[j].ref_values[0].remarks = remarks;             
                                }
                            }
            
                            
                            // console.log(removeKeys);
                            // for(var z in removeKeys) {
                            //     console.log(removeKeys[z]);
                            //     $scope.test_result[i].investigationResults[j].ref_values.splice(removeKeys[z], 1);
                            // }
                        }
                    }
                }
                
                $scope.NoVisits = 0;
            } else {
                $scope.NoVisits = 1;
            }
            //console.table($scope.dr_visit_details);
        });
        $http.get("../php/patient_info.php?action=patient_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.patient_details = res.data;
        });
        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res) {
            $scope.op_data = res.data;
        });

        $scope.action = 2;
        $medwiseLog.save('Users', 'extra Data');


        console.log($scope.currentParams);
    }

    $scope.updateVisit = function (obj) {
        $scope.update_casesheet = obj;

        $http.get("../php/patient_info.php?action=patient_details&patient_id=" + obj.patientId).then(function OnSuccess(res) {
            $scope.patient_details = res.data;
        });
        $http.get("../php/medicine_stock_register.php?action=get_instock_medicines").then(function OnSuccess(res) {
            $scope.medunits_data = res.data;

            for (var med_ind in $scope.update_casesheet.medication_details) {

                $scope.update_casesheet.medication_details[med_ind].BB = ($scope.update_casesheet.medication_details[med_ind].BB == 'true') ? true : false;
                $scope.update_casesheet.medication_details[med_ind].AB = ($scope.update_casesheet.medication_details[med_ind].AB == 'true') ? true : false;
                $scope.update_casesheet.medication_details[med_ind].BL = ($scope.update_casesheet.medication_details[med_ind].BL == 'true') ? true : false;
                $scope.update_casesheet.medication_details[med_ind].AL = ($scope.update_casesheet.medication_details[med_ind].AL == 'true') ? true : false;
                $scope.update_casesheet.medication_details[med_ind].BD = ($scope.update_casesheet.medication_details[med_ind].BD == 'true') ? true : false;
                $scope.update_casesheet.medication_details[med_ind].AD = ($scope.update_casesheet.medication_details[med_ind].AD == 'true') ? true : false;

                for (var act_med_ind in $scope.medunits_data) {
                    if ($scope.medunits_data[act_med_ind].med_id === $scope.update_casesheet.medication_details[med_ind].med_id) {
                        $scope.updateMultipleDemo.medicines.push($scope.medunits_data[act_med_ind]);
                        break;
                    }
                }
            }

            //console.log($scope.update_casesheet.medication_details);
        });
        $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res) {

            $scope.test_data = res.data;

            for (var test_ind in $scope.update_casesheet.inv_details) {

                for (var act_test_ind in $scope.test_data) {
                    if ($scope.test_data[act_test_ind].test_id === $scope.update_casesheet.inv_details[test_ind].test_id) {
                        $scope.updateCaseSheetUi.test_id.push($scope.test_data[act_test_ind]);
                        break;
                    }
                }
            }
        });

        //console.log($scope.update_casesheet.medication_details);
        $scope.getIpTypesForUpdate($scope.update_casesheet.visitedDoctor);
        $scope.update_add_btn_disable = 0;
        $scope.update_add_btn_dis_for_diagnosis = 0;
        $scope.update_add_btn_dis_for_medication = 0;
        //console.table($scope.update_casesheet);
        $scope.action = 4;
    }

    $scope.viewVisitDetails = function (obj) {
        $scope.info_casesheet = obj;
        //console.table($scope.info_casesheet);
    }

    $scope.addNew = function (patient_id, p_visit_id, bed_id) {
        $scope.casesheet.date = $scope.today.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
        $http.get("../php/patient_info.php?action=patient_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.patient_details = res.data;
        });

        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res) {
            $scope.op_data = res.data;
        });
        $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res) {
            $scope.test_data = res.data;
            //console.table($scope.test_data);
        });
        $http.get("../php/medicine_stock_register.php?action=get_instock_medicines").then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
        });

        $scope.casesheet.patient_id = patient_id;
        $scope.casesheet.p_visit_id = p_visit_id;
        $scope.casesheet.bed_id = bed_id;
        $scope.action = 3;
        $medwiseLog.save('Users', 'extra Data');
    }

    $scope.change_date = function () {
        $scope.casesheet.date = $scope.today.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
    }

    $scope.change_date_for_update = function () {
        $scope.update_casesheet.date = $scope.today.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
    }

    $scope.getIpTypes = function (drid) {
        $http.get("../php/Dr_consultation.php?action=get_ip_types&dr_id=" + drid).then(function OnSuccess(res) {
            $scope.ipTypes = res.data;
            //console.log($scope.ipTypes);
            $scope.casesheet.doctor_id = drid;
            $scope.casesheet.consultation_id = res.data[0].dr_consult_id;
            //$scope.update_casesheet.consultationType=res.data[0].type_of_consultation
        });
    }

    $scope.getIpTypesForUpdate = function (drid) {
        $http.get("../php/Dr_consultation.php?action=get_ip_types&dr_id=" + drid).then(function OnSuccess(res) {
            $scope.ipTypes = res.data;
            $scope.update_casesheet.consultation_id = res.data[0].fcname;
        });
    }

    $scope.update_select_medicine = function (ind, object) {
        //alert(object.med_id);
        $scope.update_casesheet.medication_details[ind].medicine_id = object;
        $scope.update_add_btn_dis_for_medication = 0;
    }

    $scope.update_save_caseSheet_data = function () {

        var data = $.param({
            update_casesheet: $scope.update_casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        $http.post("../php/case_sheet.php?action=update_dr_details", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Updated', data);
        });
    }


    $scope.save_caseSheet_data = function () {

        $scope.casesheet.user_id = $scope.login_data.edwise.uid;
        var data = $.param({
            casesheet: $scope.casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        //console.table($scope.casesheet);
        $http.post("../php/case_sheet.php?action=add_dr_details", data, config).then(function OnSuccess(res, config, status, header) {
            console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Added', data);
        });
    }

    $scope.displayselMedicines = function () {

        var temp_array = [];
        for (var al_ind in $scope.casesheet.medication_details) {
            temp_array.push($scope.casesheet.medication_details[al_ind]);
        }

        $scope.casesheet.medication_details = [];
        var j = 0;
        for (var i in $scope.multipleDemo.medicines) {
            if (typeof temp_array[j] === "undefined") {
                var obj = {
                    med_id: $scope.multipleDemo.medicines[i].med_id,
                    med_name: $scope.multipleDemo.medicines[i].med_name,
                    quantity: undefined,
                    BB: false,
                    AB: false,
                    BL: false,
                    AL: false,
                    BD: false,
                    AD: false
                };
            } else {
                if ($scope.multipleDemo.medicines[i].med_id !== temp_array[j].med_id) {

                    j++;
                }

                var obj = {
                    med_id: $scope.multipleDemo.medicines[i].med_id,
                    med_name: $scope.multipleDemo.medicines[i].med_name,
                    quantity: temp_array[j].quantity,
                    BB: temp_array[j].BB,
                    AB: temp_array[j].AB,
                    BL: temp_array[j].BL,
                    AL: temp_array[j].AL,
                    BD: temp_array[j].BD,
                    AD: temp_array[j].AD
                };

            }
            $scope.casesheet.medication_details.push(obj);
            j++;
        }
        //console.log($scope.casesheet.medication_details);
    }

    $scope.displayselTests = function () {
        $scope.casesheet.inv_details = [];
        for (var i in $scope.multipleItem.Tests) {
            var obj = {
                test_id: $scope.multipleItem.Tests[i].test_id,
                test_name: $scope.multipleItem.Tests[i].test_name,
                price: $scope.multipleItem.Tests[i].price,
                ref_values: JSON.parse($scope.multipleItem.Tests[i].ref_values)
            };
            $scope.casesheet.inv_details.push(obj);
        }
        //console.log($scope.casesheet.medication_details);
    }

    $scope.changeUpdateTestData = function (selectedTestData) {

        var previous_details = $scope.update_casesheet.inv_details;
        //console.log(previous_details);

        if (selectedTestData.length > 0) {
            $scope.update_casesheet.inv_details = [];
        } else {
            $scope.update_casesheet.inv_details = [];
            return;
        }

        if(previous_details === null) {
            var obj = {
                test_id: selectedTestData[0].test_id,
                test_name: selectedTestData[0].test_name,
                price: selectedTestData[0].price,
                ref_values: JSON.parse(selectedTestData[0].ref_values)
            };
            $scope.update_casesheet.inv_details.push(obj);

            return;
        }

        for (var i in selectedTestData) {

            var flag = false;
            for (var j in previous_details) {


                if (selectedTestData[i].test_id === previous_details[j].test_id) {
                    flag = true;
                    var obj = {
                        test_id: selectedTestData[i].test_id,
                        test_name: selectedTestData[i].test_name,
                        price: selectedTestData[i].price,
                        ref_values: JSON.parse(selectedTestData[i].ref_values)
                    };

                    $scope.update_casesheet.inv_details.push(obj);
                    break;
                }

                if ((j == previous_details.length - 1) && flag === false) {
                    var obj = {
                        test_id: selectedTestData[i].test_id,
                        test_name: selectedTestData[i].test_name,
                        price: selectedTestData[i].price,
                        ref_values: JSON.parse(selectedTestData[i].ref_values)
                    };
                    $scope.update_casesheet.inv_details.push(obj);
                }
            }
        }
    }


    $scope.changeUpdateMedData = function (selectedMedicines) {

        var previous_details = $scope.update_casesheet.medication_details;
        //console.log(previous_details);s
        if (selectedMedicines.length > 0) {
            $scope.update_casesheet.medication_details = [];
        } else {
            $scope.update_casesheet.medication_details = [];
            return;
        }
        // $scope.update_casesheet.inv_details = selectedTestData;
       
        if(previous_details === null) {
            var obj = {
                med_id: selectedMedicines[0].med_id,
                med_name: selectedMedicines[0].med_name,
                quantity: undefined,
                BB: false,
                AB: false,
                BL: false,
                AL: false,
                BD: false,
                AD: false
            };
            $scope.update_casesheet.medication_details.push(obj);

            return;
        }

        for (var i in selectedMedicines) {

            var flag = false;

            for (var j in previous_details) {


                if (selectedMedicines[i].med_id === previous_details[j].med_id) {
                    flag = true;
                    var obj = {
                        med_id: selectedMedicines[i].med_id,
                        med_name: selectedMedicines[i].med_name,
                        quantity: previous_details[j].quantity,
                        BB: previous_details[j].BB,
                        AB: previous_details[j].AB,
                        BL: previous_details[j].BL,
                        AL: previous_details[j].AL,
                        BD: previous_details[j].BD,
                        AD: previous_details[j].AD
                    };

                    $scope.update_casesheet.medication_details.push(obj);
                    break;
                }

                if ((j == previous_details.length - 1) && flag === false) {
                    var obj = {
                        med_id: selectedMedicines[i].med_id,
                        med_name: selectedMedicines[i].med_name,
                        quantity: undefined,
                        BB: false,
                        AB: false,
                        BL: false,
                        AL: false,
                        BD: false,
                        AD: false
                    };
                    $scope.update_casesheet.medication_details.push(obj);
                }
            }
        }
    }


    $scope.addOrUpdateTestResult = function (obj) {
        $scope.addTestReults = obj;
        $scope.action = 5;
    }


    $scope.updateInvestigationFormData = function () {

        $scope.addTestReults.user_id = $scope.login_data.edwise.uid;
        var data = $.param({
            investigationResults: $scope.addTestReults
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        $http.post("../php/case_sheet.php?action=update_investigations", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Added', data);
        });
    }


    $scope.showTab = function (id, obj) {

        $(".tab-pane").removeClass("in active");
        $(id).addClass("in active");
        $(".nav li").removeClass("active");
        $(obj).parent().addClass("active");
    }


    $scope.updateCaseSheetVisits = function () {
        alert();
        $scope.update_casesheet.user_id = $scope.login_data.edwise.uid;

        var data = $.param({
            updatedDoctorVisits: $scope.update_casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        //console.table($scope.casesheet);
        $http.post("../php/case_sheet.php?action=update_doctor_visits", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Added', data);
        });
    }


    $scope.updateCaseSheetInvestigations = function () {
        $scope.update_casesheet.user_id = $scope.login_data.edwise.uid;
        var data = $.param({
            updatedInvestigations: $scope.update_casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        //console.table($scope.casesheet);
        $http.post("../php/case_sheet.php?action=update_investigations_for_caseSheet", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Updated', data);
        });
    }


    $scope.updateCaseSheetPrescriptions = function () {
        $scope.update_casesheet.user_id = $scope.login_data.edwise.uid;
        var data = $.param({
            updatedPrescriptions: $scope.update_casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        //console.table($scope.casesheet);
        $http.post("../php/case_sheet.php?action=update_prescriptions", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Added', data);
        });
    }


    $scope.updateCaseSheetOthers = function () {
        $scope.update_casesheet.user_id = $scope.login_data.edwise.uid;
        var data = $.param({
            updatedOthers: $scope.update_casesheet
        });
        var config = {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };
        //console.table($scope.casesheet);
        $http.post("../php/case_sheet.php?action=update_others", data, config).then(function OnSuccess(res, config, status, header) {
            //console.log(res.data);
            $route.reload();
            $medwiseLog.save('CaseSheet Added', data);
        });
    }

});
