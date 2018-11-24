angular.module('medwise').controller('newpaitent_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog, $location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.patient_new_reg = {}; 
    $scope.patient_visit = {};
    $scope.patient_visit.consultation = [];
    $scope.patient_new_reg.basic_info = [];
    $scope.patient_new_reg.consultation = [];
    $scope.ad = {};
    $scope.ad.aadhardt = [];
    $scope.myObj = [];
    $scope.pre_index = "";
    $scope.totalRoomAmount = 0;
    $scope.totalDoctorVisitAmount = 0;
    $scope.labInvestigationsAmount = 0;
    $scope.totalDueAmountOfVisit = 0;
    $scope.investigationsThere = false;
    $scope.room_allot = {};
    $scope.enableSearchDateBtnForIp = 0;

    $scope.currentParams = $route.current.params;

    $scope.dateOfOpNotDb = new Date();
    $scope.dateOfOp = $scope.dateOfOpNotDb.toLocaleDateString('en-US', {
        day: "2-digit",
        month: "long",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: false
    });

    $scope.dischargeDateOfVisit = new Date();
    $scope.dischargeDateOfVisitForDb = $scope.dischargeDateOfVisit.toLocaleDateString('en-US', {
        day: "2-digit",
        month: "long",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: false
    });

    $scope.mDateOfOpNotDbInExistPatient = new Date();
    $scope.mDateOfOpInExistPatient = $scope.mDateOfOpNotDbInExistPatient.toLocaleDateString('en-US', {
        day: "2-digit",
        month: "long",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: false
    });

    $scope.qDateOfOpNotDbInExistPatient = new Date();
    $scope.qDateOfOpInExistPatient = $scope.qDateOfOpNotDbInExistPatient.toLocaleDateString('en-US', {
        day: "2-digit",
        month: "long",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: false
    });


    //Init method calls after page has loaded.
    $scope.init = function () {

        $scope.action = 'showNewPatientHome';
        $scope.subAction = 'showOutPatientsList';
        
        $scope.enableViewButton = false;
        $scope.aadharData = {};
        $scope.addBtnDisable = true;

        $scope.tempDateModelFromDate = new Date();
        $scope.tempDateModelToDate = new Date();
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', {
            day: "2-digit",
            month: "long",
            year: "numeric"
        });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', {
            day: "2-digit",
            month: "long",
            year: "numeric"
        });

        //Get Today Op List
        console.log($scope.changeFromDateDate);
        $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date=" + $scope.changeFromDateDate + "&to_date=" + $scope.changeToDateDate).then(function OnSuccess(res) {
            $scope.outPatientsList = res.data;
            //console.log($scope.outPatientsList);
            if (Array.isArray($scope.outPatientsList)) {
                $scope.recordsAvailable = true;
            } else {
                $scope.outPatientsList = [];
                $scope.recordsAvailable = false;
            }
        });

        //Get Active Inpatients List
        $http.get("../php/patient_info.php?action=active_ip_visits").then(function OnSuccess(res) {
            $scope.inPatientsList = res.data;
            //console.log($scope.inPatientsList);
            if (Array.isArray($scope.inPatientsList)) {
                $scope.NOIP = true;
            } else {
                $scope.inPatientsList = [];
                $scope.NOIP = false;
            }
        });
        // $http.get("../php/patient_info.php?action=specificdate_ip_visits&from_date="+$scope.from_date_for_ip+"&to_date="+$scope.to_date_for_ip).then(function OnSuccess(res) {
        // 	    $scope.inPatientsList = res.data;
        // 			console.log($scope.inPatientsList);
        //       if(Array.isArray($scope.inPatientsList)){
        //           $scope.NOIP = true;
        //       } else{
        //           $scope.inPatientsList = [];
        //           $scope.NOIP = false;
        //       }
        // });

        //Get All Dotors
        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res) {
            $scope.doctorsData = res.data;
        });

        //Get All PRO's
        $http.get("../php/login.php?action=get_pros").then(function OnSuccess(res) {
            $scope.proList = res.data;
        });

        //Get All Referrals
        $http.get("../php/referrals.php?action=ref_status").then(function OnSuccess(res) {
            $scope.referralList = res.data;
        });

        $scope.resetOpFields();

        if($scope.currentParams.patientId !== undefined) {
            $scope.patientIdForDetails = $scope.currentParams.patientId;
            //console.log($scope.patientIdForDetails);
            $scope.action = $scope.currentParams.action;

            if($scope.currentParams.action == 'showOutPatientsList'){
                $scope.action = 'showNewPatientHome';
                $scope.subAction = 'showOutPatientsList';
            }else{
                $scope.action = $scope.currentParams.action;
            }
        }
    }

    //Open Lab Payment Modal for OP
    $scope.openLabPayment = function(patient_id){
        $scope.lab_billing = {};
        $scope.lab_billing.test = [];
        $scope.lab_billing.payment_type = 'Cash';
        $scope.lab_billing.hospital_id = '1';
        $scope.addBtnDisable_for_bill = 'yes';
        $scope.tempDateModel = new Date();
				$scope.lab_billing.transaction_date = $scope.tempDateModel.toLocaleDateString('en-US' , {day:'2-digit', month: 'long', year: 'numeric'});
        $http.get("../php/collection.php?action=get_latest_visit&patient_id=" + patient_id).then(function OnSuccess(res) {
            //console.log($scope.patient_visit_details);
            $scope.patient_visit_details = res.data;
            $scope.p_v_id = res.data[0].p_visit_id;
            $scope.Type = res.data[0].patient_type;
            $scope.isBillSettled = res.data[0].isBillSettled;
                $http.get("../php/collection.php?action=get_paid_amount&p_visit_id=" + $scope.patient_visit_details[0].p_visit_id).then(function OnSuccess(res) {
                    $scope.totalPaidAmount = Number(res.data[0].paid_amount);
                });
                // if($scope.Type == 'In Patient')
                // {
                //     $http.get("../php/case_sheet.php?action=get_investigations_list_for_visit&visit_id="+$scope.p_v_id).then(function OnSuccess(res){
                //         //console.table(res.data);
                //         var isAnyRecord = false;
                //         if(Array.isArray(res.data)) {
                //             for(var i in res.data) {
                //                 if(JSON.parse(res.data[i].investigationsPerformed) !== null) {
                //                     res.data[i].investigationsPerformed = JSON.parse(res.data[i].investigationsPerformed);
                //                     isAnyRecord = true;
                //                 }
                //             }
                //             if(isAnyRecord === true) {
                //                 $scope.inpatientInvestigations = res.data;
                //             } else {
                //                 $scope.inpatientInvestigations = [];
                //                 $scope.showNoInvestigations = false;
                //             }
                //         } else {
                //             $scope.inpatientInvestigations = [];
                //             $scope.showNoInvestigations = false;
                //         }
                //         //console.log($scope.inpatientInvestigations);
                //     });
                //     $http.get("../php/case_sheet.php?action=get_prescriptions_list_for_visit&visit_id="+$scope.p_v_id).then(function OnSuccess(res){
                //         //console.log(res.data);
                //         if(Array.isArray(res.data)) {
                //             for(var i in res.data) {
                //                 res.data[i].prescribedMedication = JSON.parse(res.data[i].prescribedMedication);
                //             }
                //             $scope.inpatientPrescriptions = res.data;
                //         } else {
                //             $scope.inpatientPrescriptions = [];
                //             $scope.showNoPrescriptions = true;
                //         }
                //         //console.log($scope.inpatientPrescriptions);
                //     });
                // }
            $http.get("../php/hospital.php?action=select").then(function OnSuccess(res) {
                $scope.hospital = res.data;
                //console.log($scope.hospital);
            });
            $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res) {
                $scope.test_data = res.data;
                if(!Array.isArray($scope.test_data)) {
                    $scope.test_data = [];
                }
                //console.table($scope.test_data);
            });
            $scope.lab_billing.patient_id = patient_id;
            $scope.lab_billing.patient_type = $scope.Type;
            $scope.lab_billing.p_visit_id = $scope.patient_visit_details[0].p_visit_id;
            $scope.lab_billing.dr_id = $scope.patient_visit_details[0].doctor_id;
            $scope.lab_billing.user_id = $scope.login_data.edwise['uid'];
        });
        if ($scope.lab_billing.test.length == 0)
        var temp = {};
        $scope.lab_billing.test.push(temp);
    }
 
    //Save Lab Payment Modal for OP
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
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
            $http.post("../php/collection.php?action=add_test_lab_billing",data,config).then(function OnSuccess(res,status,header,config){
                $scope.receipt = res.data;
                //console.log($scope.receipt);
								$('#LabModal').modal("hide");
								$('#lab_billingID').modal("show");
            });
            //$medwiseLog.save('Users','extra Data');
    }

    //Open Lab Payment Receipt Modal for OP
	$scope.printReceipt = function (opp){
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

    //Reload the page
	$scope.reloadPage = function () {
        $route.reload();
    }

    //Add more item in labpayment
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

    //Remove item from in labpayment
    $scope.remove_for_lab_billing = function (ind) {
        $scope.lab_billing.test.splice(ind, 1);
        $scope.get_paid_amount_for_biiling();
    }

    $scope.select_bil_category_for_selection_of_test = function (obj, ind) {
        $scope.lab_billing.test[ind].test_id = obj.test_id;
        $scope.lab_billing.test[ind].test_name = obj.test_name;
        $scope.lab_billing.test[ind].paid_amount = obj.price;
        $scope.lab_billing.test[ind].ref_values = JSON.parse(obj.ref_values);
        $scope.get_paid_amount_for_biiling();
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

    $scope.redirectToFarmacyBillingPage = function (patientId, name) {
        //$location.path("/pharmacybilling");
        $location.path("/pharmacybilling").search({
            patientId: patientId,     
            name: name,
            action : 'showOutPatientsList'  
        });
    }

    $scope.redirectToCasualtyPage = function (patientId, name) {      
        $location.path("/casualtymedicine").search({
            patientId: patientId,
            name: name,
            action : 'showOutPatientsList'
        });
    }

    $scope.changeOpDate = function () {
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
        $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date&from_date=" + $scope.changeFromDateDate + "&to_date=" + $scope.changeToDateDate).then(function OnSuccess(res) {
            $scope.outPatientsList = res.data;
            //console.log($scope.outPatientsList);
            if (Array.isArray($scope.outPatientsList)) {
                $scope.recordsAvailable = true;
            } else {
                $scope.outPatientsList = [];
                $scope.recordsAvailable = false;
            }
        });
    }

    $scope.change_from_date_for_ip = function (from_date_model_for_ip) {
        var temp = new Date(from_date_model_for_ip);
        $scope.from_date_for_ip = temp.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
        if ($scope.from_date_model_for_ip !== undefined && $scope.to_date_model_for_ip !== undefined) {
            $scope.enableSearchDateBtnForIp = 1;
        }
        // alert($scope.from_date_for_ip);
        // alert($scope.to_date_for_ip);

    }

    $scope.change_to_date_for_ip = function (to_date_model_for_ip) {
        var temp = new Date(to_date_model_for_ip);
        $scope.to_date_for_ip = temp.toLocaleDateString('en-US', {
            day: '2-digit',
            month: 'long',
            year: 'numeric'
        });
        if ($scope.from_date_model_for_ip !== undefined && $scope.to_date_model_for_ip !== undefined) {
            $scope.enableSearchDateBtnForIp = 1;
        }
        // alert($scope.from_date_for_ip);
        // alert($scope.to_date_for_ip);

    }

    //Get IP Details
    $scope.getIP = function () {
        // alert($scope.from_date_for_ip);
        // alert($scope.to_date_for_ip);
        // if($scope.from_date_model_for_ip == undefined || $scope.to_date_model_for_ip == undefined){
        //     swal('Select Date First');
        //     return;
        // }
        $http.get("../php/patient_info.php?action=specificdate_ip_visits&from_date=" + $scope.from_date_for_ip + "&to_date=" + $scope.to_date_for_ip).then(function OnSuccess(res) {
            $scope.inPatientsList = res.data;
            //console.log($scope.inPatientsList);
            if (Array.isArray($scope.inPatientsList)) {
                $scope.NOIP = true;
            } else {
                $scope.inPatientsList = [];
                $scope.NOIP = false;
            }
        });

    }

    //Restore the page
    $scope.Home = function () {

        $scope.action = 'showNewPatientHome';
        $scope.subAction = 'showOutPatientsList';
        $scope.patientSearchQuery = undefined;
        $scope.enableViewButton = false;
        $scope.aadharData = {};
        $scope.resetOpFields();
        $scope.addBtnDisable = true;
    }

    //Show today's outpatients List
    $scope.getOutPatientsList = function () {
        $scope.subAction = 'showOutPatientsList';

        $scope.tempDateModelFromDate = new Date();
        $scope.tempDateModelToDate = new Date();

        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', {
            day: "2-digit",
            month: "long",
            year: "numeric"
        });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', {
            day: "2-digit",
            month: "long",
            year: "numeric"
        });

        $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date=" + $scope.changeFromDateDate + "&to_date=" + $scope.changeToDateDate).then(function OnSuccess(res) {
            $scope.outPatientsList = res.data;
            //console.log($scope.outPatientsList);
            if (Array.isArray($scope.outPatientsList)) {
                $scope.recordsAvailable = true;
            } else {
                $scope.outPatientsList = [];
                $scope.recordsAvailable = false;
            }
        });
    }

    //Show Active Inpatient's list
    $scope.getInpatientsList = function () {
        $scope.subAction = 'showInPatientsList';
    }

    //Show Add New Patient Form
    $scope.addNewPatient = function () {
        $scope.casualtyConsultantDoctors = [];
        $scope.casualtyConsultantDoctors.push({});
        $scope.action = 'showNewPatientForm';
    }

    $scope.enableOrDisableAddBtn = function () {
        $scope.addBtnDisable = false;
        for (var i in $scope.casualtyConsultantDoctors) {
            if ($scope.casualtyConsultantDoctors[i].amount === undefined || $scope.casualtyConsultantDoctors[i].amount === '') {
                //alert();
                $scope.addBtnDisable = true;
            }
        }
    }
    //Add Consultant doctor in casualty op
    $scope.addConsultantDoctor = function () {
        $scope.casualtyConsultantDoctors.push({});
        $scope.enableOrDisableAddBtn();
    }

    //Remove Consultant Doctor
    $scope.removeConsultantDoctor = function (index) {
        $scope.casualtyConsultantDoctors.splice(index, 1);
        $scope.enableOrDisableAddBtn();
    }


    //Check If patient exist or not, based on either QR code or manually.
    $scope.checkIfPatientExistOrNot = function (patientSearchQuery) {
        //console.log(patientSearchQuery);
        $scope.di = 2;
        if (patientSearchQuery === "") {
            $scope.enableViewButton = false;
        }
        if (patientSearchQuery.substr(-2) === '/>') {
            $scope.enableViewButton = false;
            var xmlObject = StringToXML(patientSearchQuery)
            getXMLInfo(xmlObject);
        } else if (patientSearchQuery.substr(0, 1) !== '<') {
            $scope.enableViewButton = true;
        }


        function StringToXML(patientSearchQuery) {

            if (window.ActiveXObject) {
                var oXML = new ActiveXObject("Microsoft.XMLDOM");
                oXML.loadXML(patientSearchQuery);
                return oXML;
            } else {
                return new DOMParser().parseFromString(patientSearchQuery, "text/xml");
            }
        }

        function getXMLInfo(xmlObject) {

            var xmlAttr = xmlObject.getElementsByTagName("PrintLetterBarcodeData")[0].attributes;
            var aadharNo = xmlAttr[0].value;
            $http.get("../php/patient_info.php?action=aadhar_search&aadhar_no=" + aadharNo).then(function OnSuccess(res) {
                $scope.matchedPatientsList = res.data;
                if (Array.isArray($scope.matchedPatientsList)) {
                    $scope.enableViewButton = false;
                    $scope.patientSearchQuery = "";
                    $scope.subAction = 'showPatientSearchResults';
                } else {
                    getAadharData(xmlAttr);
                    $scope.action = 'showNewPatientForm';
                }
            });
        }

        function getAadharData(xmlAttr) {

            var obj = {};
            for (i = 0; i < xmlAttr.length; i++) {
                obj[xmlAttr[i].name] = xmlAttr[i].value;
            }
            var aadharData = obj;
            $scope.aadharData = obj;

            var currentDate = new Date();
            var currentYear = currentDate.getFullYear();
            var dateOfBirth = new Date(aadharData.dob);
            var birthDate = dateOfBirth.getDate();
            var birthMonth = dateOfBirth.getMonth();
            var birthYear = dateOfBirth.getFullYear();
            if (birthMonth < 10)
                birthMonth = "0" + (birthMonth + 1);

            if (birthDate < 10)
                birthDate = "0" + birthDate;

            $scope.dateOfBirth = dateOfBirth.toLocaleDateString('en-GB', {
                day: 'numeric',
                month: 'numeric',
                year: 'numeric'
            });
            $scope.aadharData.age = Number(currentYear) - Number(birthYear);
        }
    }

    //Get Patient Data if check query is manually given.
    $scope.getPatientData = function (patientSearchQuery) {
        $http.get("../php/patient_info.php?action=search&search_string=" + patientSearchQuery).then(function OnSuccess(res) {
            $scope.matchedPatientsList = res.data;
            //console.log($scope.patientData);
            $scope.subAction = 'showPatientSearchResults';
            if (Array.isArray($scope.matchedPatientsList)) {

                $scope.recordsAvailable = true;
                for (var i in $scope.matchedPatientsList) {
                    $scope.matchedPatientsList[i].patient_id = Number($scope.matchedPatientsList[i].patient_id);
                }
            } else {

                $scope.recordsAvailable = false;
            }
        });
        $scope.patientSearchQuery = "";
    }

    //Check whether the mobile no is existed or not
    $scope.checkMobileExistsOrNot = function () {

        $http.get("../php/patient_info.php?action=mobile_n&search_1=" + $scope.mobile).then(function OnSuccess(res) {
            //console.log(res.data);
            if (Array.isArray(res.data)) {
                alert("Patient already Registered");
                $scope.mobile = "";
            }
        });
    }

    //Get Op Types Of a doctor
    $scope.getOpTypesOfDoctor = function (doctorId) {

        $http.get("../php/Dr_consultation.php?action=get_op_types&dr_id=" + doctorId).then(function OnSuccess(res) {
            $scope.doctorOpTypes = res.data;
        });
    }

    //Get op amount of op type
    $scope.getOpAmount = function (optype) {
        $http.get("../php/Dr_consultation.php?action=get_amount&dr_consult_id=" + optype).then(function OnSuccess(res) {

            $scope.opAmount = res.data[0].amount;
            $scope.fcid = res.data[0].fcid;
        });
    }

    //Register new patient
    $scope.registerPatient = function () {

        var guardianName = $scope.aadharData.co;

        if (guardianName.substring(0, 3) === 'S/O') {
            guardianName = guardianName.substring(3);
        }
        $scope.aadharData.co = guardianName.trim();


        //var d = new Date($scope.date_of_birth);
        //var dob = d.getFullYear()+'/'+(parseInt(d.getMonth())+1)+'/'+d.getDate();


        var basicinfoobj = {
            name: $scope.aadharData.name,
            father_name: $scope.aadharData.co,
            gender: $scope.aadharData.gender,
            age: $scope.age,
            city: $scope.aadharData.vtc,
            mobile: $scope.mobile
        };

        var consultationobj = {
            dr_consult_id: $scope.opType,
            dr_id: $scope.consultantDoctor,
            pro_id: $scope.pro,
            ref_id: $scope.referral,
            consultation_amount: $scope.opAmount,
            diagnosis: $scope.diagnosis,
            fcid: $scope.fcid,
            date_of_op: $scope.dateOfOp,
            user_id: $scope.login_data.edwise['uid'],
            isCasualty: $scope.isCasualty,
            consultantDoctors: $scope.casualtyConsultantDoctors,
            casualtyCharges: $scope.casualtyCharges,
            casualtyRemarks: $scope.casualtyRemarks
        };

        $scope.patient_new_reg.basic_info.push(basicinfoobj);
        $scope.patient_new_reg.consultation.push(consultationobj);
        $scope.patient_new_reg.visit_type = "op";
        
        var data = $.param({
            patient_new_reg: $scope.patient_new_reg
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/patient_info.php?action=add_new", data, config).then(function OnSuccess(res, status, header, config) {
            console.log(res.data);
            $route.reload();
        });
        $medwiseLog.save('New Patient', data);
    }
	
	
    //Get Previous visits of patient
    $scope.getPreviousVisitsOfPatient = function (patientId, patientName) {

        $scope.resetOpFields();
        $scope.patient_visit.patient_id = patientId;

        $http.get("../php/patient_info.php?action=visit_details&patient_id=" + patientId).then(function OnSuccess(res) {
            $scope.previousVisitDetails = res.data;
            console.log($scope.previousVisitDetails);
            if (Array.isArray($scope.previousVisitDetails)) {
                $scope.recordsAvailable = true;
                $scope.patientNameForModal = $scope.previousVisitDetails[0].name;
            } else {
                $scope.recordsAvailable = false;
                $scope.patientNameForModal = patientName;
            }
        });
    }

    //Assign selected previous op
    $scope.assignPreviousOp = function (visitId) {

        $http.get("../php/patient_info.php?action=specific_visit&visit_id=" + visitId).then(function OnSuccess(res) {
            $scope.previousVisitData = res.data;
            //console.log($scope.previousVisitData.name);
            $scope.consultantDoctor = $scope.previousVisitData[0].dr_id;
            $scope.getOpTypesOfDoctor($scope.previousVisitData[0].dr_id);
            $scope.opType = $scope.previousVisitData[0].dr_consult_id;
            //console.log($scope.moptype);

            var visit_date = new Date($scope.previousVisitData[0].visit_date);
            var today_date = new Date();

            var visit_date_in_time = visit_date.getTime();
            var today_date_in_time = today_date.getTime();

            var diff_in_time_stamp = Math.abs(visit_date_in_time - today_date_in_time);
            var no_of_days = Math.ceil(diff_in_time_stamp / (1000 * 3600 * 24));

            var valid_visit_days = $scope.previousVisitData[0].valid_days;
            var valid_visits = $scope.previousVisitData[0].valid_visits;
            var dr_consult_id = $scope.previousVisitData[0].dr_consult_id;

            $http.get("../php/patient_info.php?action=get_valid_visited_count_indate&visit_id=" + visitId + "&dr_consult_id=" + dr_consult_id).then(function OnSuccess(res) {
                //console.log(res.data);
                var valid_visited_count = Number(res.data[0].valid_visited_count);
                //console.log(no_of_days + " " + valid_visit_days + " " + valid_visited_count + " " + valid_visits);
                if ((no_of_days > valid_visit_days) || valid_visited_count >= valid_visits) {
                    $scope.opAmount = $scope.previousVisitData[0].amount;
                } else {
                    $scope.opAmount = 0;
                }
            });
        });
    }

    //Save Visit
    $scope.saveVisit = function () {

        var consultationobj = {
            dr_consult_id: $scope.opType,
            dr_id: $scope.consultantDoctor,
            pro_id: $scope.pro,
            ref_id: $scope.referral,
            consultation_amount: $scope.opAmount,
            diagnosis: $scope.diagnosis,
            fcid: $scope.fcid,
            date_of_op: $scope.mDateOfOpInExistPatient,
            user_id: $scope.login_data.edwise['uid']
        };

        $scope.patient_visit.consultation.push(consultationobj);
        $scope.patient_visit.visit_type = "op";
        var data = $.param({
            patient_visit: $scope.patient_visit
        });
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };

        $http.post("../php/patient_info.php?action=add_visit", data, config).then(function OnSuccess(res, status, header, config) {
            $route.reload();
        });
    }

    //Add Inpatient
    $scope.addInpatient = function (patientId, visitId, doctorId) {

        $window.sessionStorage.setItem('patient_id', patientId);
        $window.sessionStorage.setItem('p_visit_id', visitId);
        $window.sessionStorage.setItem('dr_id', doctorId);
        $location.path("inpatient");
    }

    //Delete OP Details if op is not correct
    $scope.deleteOpDetails = function (visitId) {
        $http.get("../php/patient_info.php?action=delete&p_visit_id=" + visitId).then(function OnSuccess(res) {
            //console.log(res.data);
            $route.reload();
        });
    }

    //Open Print OP Details Modal And Get Op Details
    $scope.openPrintOpDetailsModal = function (visitId) {
        $http.get("../php/patient_info.php?action=specific_visit&visit_id=" + visitId).then(function OnSuccess(res) {
            $scope.opDetailsForPrint = res.data;
			$scope.totalReceiptAmount = 0;
			for(var i in $scope.opDetailsForPrint[0].paidDetails) {
				$scope.totalReceiptAmount += Number($scope.opDetailsForPrint[0].paidDetails[i].amount);
			}
            console.log($scope.opDetailsForPrint);
        });

        $http.get("../php/hospital.php?action=get_main_hospital_details").then(function OnSuccess(res) {
            $scope.hospitalDetails = res.data;
        });
    }

    //Print OP Details
    $scope.printOpDetails = function (divId) {
        $scope.PrintShow = 1;
        var mywindow = window.open('', 'PRINT', 'height=800,width=1200');

        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        //mywindow.document.write('</head><body >');
        //mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(divId).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();
        $scope.PrintShow = 0;
        return true;
    }

    //Open IP Details Form Of Patient
    $scope.openIpDetailsFormOfPatient = function (patientId) {
        $scope.patientIdForDetails = patientId;
        //console.log($scope.patientIdForDetails);
        $scope.action = 'showIpDetailsForm';
    }

    //Reset Op Fields
    $scope.resetOpFields = function () {

        $scope.consultantDoctor = undefined;
        $scope.opType = undefined;
        $scope.pro = undefined;
        $scope.referral = undefined;
        $scope.opAmount = undefined;
        $scope.patient_visit = {};
        $scope.patient_visit.consultation = [];
    }

});
