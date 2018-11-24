angular.module('medwise').directive('ipdetails', ['$http', '$window', '$medwiseLog', '$route', '$location', function ($http, $window, $medwiseLog, $route, $location) {
    return {
        restrict: 'E',
        scope: {
            patientid: '=patientid'
        },
        controller: function ($scope) {
            //console.log($scope.patientid);
            $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
            $scope.level = parseInt($scope.login_data.edwise.level);

            $scope.init = function () {

                $scope.collection = {};
                $scope.collection.paid_details = [];
                $scope.collection.paid_details.push({});
                $scope.collection.payment_type = 'Cash';

                //Payment Transaction Date
                $scope.transactionDate = new Date();
                $scope.collection.transaction_date = $scope.transactionDate.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                });

                $scope.lab_billing = {};
                $scope.lab_billing.test = [];
                $scope.lab_billing.test.push({});
                $scope.lab_billing.payment_type = 'Cash';

                //Lab Payment Transaction Date
                $scope.labTransactionDate = new Date();
                $scope.lab_billing.transaction_date = $scope.labTransactionDate.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                });

                $scope.roomChange = {};
                $scope.roomChange.patient_id = $scope.patientid;

                //Room Change Date
                $scope.vacatedDate = new Date();
                $scope.roomChange.vacatedDate = $scope.vacatedDate.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                });

                //Final Bill Settlement Date
                $scope.billSettlementDateOfVisit = new Date();
                $scope.billSettlementDateOfVisitForDb = $scope.billSettlementDateOfVisit.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                });

                $scope.dischargeDateOfVisit = new Date();
                $scope.dischargeDateOfVisitForDb = $scope.dischargeDateOfVisit.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: 'long',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit',
                    hour12: false
                });

                //Get Patient Details
                $http.get('../php/patient_info.php?action=ipDetailsOfpatient&patient_id=' + $scope.patientid).then(function (res) {
                    $scope.patientDetails = res.data[0];
                    // console.log($scope.patientDetails);

                    $scope.visitId = $scope.patientDetails.p_visit_id;
                    $scope.doctorId = $scope.patientDetails.incharge_doctor_id;
                    $scope.bedId = $scope.patientDetails.bed_id;
                    $scope.roomChange.visit_id = $scope.visitId;

                    //Get Given Investigations
                    $http.get("../php/case_sheet.php?action=get_investigations_list_for_visit&visit_id=" + $scope.visitId).then(function OnSuccess(res) {
                        //console.table(res.data);
                        var isAnyRecord = false;
                        if (Array.isArray(res.data)) {
                            for (var i in res.data) {
                                if (JSON.parse(res.data[i].investigationsPerformed) !== null) {
                                    res.data[i].investigationsPerformed = JSON.parse(res.data[i].investigationsPerformed);
                                    isAnyRecord = true;
                                }
                            }
                            if (isAnyRecord === true) {
                                $scope.inpatientInvestigations = res.data;
                                $scope.showNoInvestigations = true;
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
                });

                //Get Previous visit details
                $http.get("../php/patient_info.php?action=previous_visit_details&patient_id=" + $scope.patientid).then(function OnSuccess(res) {
                    $scope.previousVisitsList = res.data;
                    //console.log($scope.previousVisitsList);
                    if (Array.isArray($scope.previousVisitsList)) {
                        $scope.NoDataForVisit = 0;
                    } else {
                        $scope.NoDataForVisit = 1;
                    }
                });

                //Get Previous Bill Details
                $http.get("../php/patient_info.php?action=previous_bill_details&patient_id=" + $scope.patientid).then(function OnSuccess(res) {
                    $scope.previousBillsList = res.data;
                    if (Array.isArray($scope.previousBillsList)) {
                        $scope.NoData = 0;
                    } else {
                        $scope.NoData = 1;
                    }
                });

                //Get Hospitals List
                $http.get("../php/hospital.php?action=select").then(function OnSuccess(res) {
                    $scope.hospitalsList = res.data;
                    $scope.collection.hospital_id = $scope.hospitalsList[0]['hid'];
                    $scope.lab_billing.hospital_id = $scope.hospitalsList[0]['hid'];
                    //console.table($scope.hospital);
                });

                //Get Bill Category List
                $http.get("../php/bill_category.php?action=get_general_bill_categories").then(function OnSuccess(res) {
                    $scope.billCategories = res.data;
                });

                //Get Investigations List
                $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res) {
                    $scope.test_data = res.data;
                    if (!Array.isArray($scope.test_data)) {
                        $scope.test_data = [];
                    }
                });

                //Get Beds List
                $http.get("../php/beds.php?act=for_bed_allocation").then(function OnSuccess(res) {
                    $scope.bedsList = res.data;
                    //console.table($scope.data);
                });
            }

            $scope.openPharmacyPayment = function (patientId, name) {
                //$location.path("/pharmacybilling");
                $location.path("/pharmacybilling").search({
                    patientId: patientId,  
                    name: name,
                    action : 'showIpDetailsForm'   
                });
            }


            $scope.redirectToCaseSheet = function () {
                $location.path("/casesheet").search({
                    patientId: $scope.patientid,
                    visitId: $scope.visitId,
                    bedId: $scope.bedId,
                    action: 'showIpDetailsForm'
                });
            }

            $scope.redirectToIS = function () {
                $location.path("/informationsheet").search({
                    patientId: $scope.patientid,
                    name    : 'chk',
                    visitId: $scope.visitId,
                    bedId: $scope.bedId,
                    action: 'showIpDetailsForm'
                });
            }

            $scope.displayVisits = function () {
                $scope.showSubAction = 'displayVisits';
            }

            $scope.displayBills = function () {
                $scope.showSubAction = 'displayBills';
            }

            $scope.show_rec = function (recno) {
                $http.get("../php/collection.php?action=get_receipt_details&receipt_code=" + recno).then(function OnSuccess(res) {
                    $scope.rec_data = res.data;
                    //console.table($scope.rec_data);
                    if (Array.isArray($scope.rec_data)) {
                        $scope.norec = 0;
                        var date = new Date();
                        var day = date.getDate();
                        if (day < 10) {
                            day = '0' + day;
                        }
                        var month = date.getMonth() + 1;
                        if (month < 10) {
                            month = '0' + month;
                        }
                        var year = date.getFullYear();
                        var todate = day + "-" + month + "-" + year;

                        if (todate == $scope.rec_data[0].date_time) {
                            $scope.btnEnalbe = 1;
                        } else {
                            $scope.btnEnalbe = 0;
                        }
                    } else {
                        $scope.norec = 1;
                    }
                });
                $medwiseLog.save('CancelRec', "Get Receipt data");
            }

            $scope.cancel_rec = function (receipt_code) {
                $scope.user_id = $scope.login_data.edwise.uid;
                $http.get("../php/collection.php?action=cancel_receipt&receipt_code=" + receipt_code + "&user_id=" + $scope.user_id).then(function OnSuccess(res) {
                    $scope.data = res.data;
                    //console.log($scope.data);
                    swal("Receipt Successfully Cancelled ");
                    $scope.init();
                    $scope.showSubAction = "displayBills";
                });
                $medwiseLog.save('CancelRec', "Receipt Canceled");
            }

            $scope.openPayment = function () {
                $scope.showSubAction = 'openPayment';
            }

            $scope.openLabPayment = function () {
                $scope.showSubAction = 'openLabPayment';
            }

            $scope.openRoomChange = function () {
                $scope.showSubAction = 'openRoomChange';
            }

            $scope.openBillSettlement = function (patientId, visitId) {
                $scope.showSubAction = 'openBillSettlement';
                $scope.loadFinalBillSettlement(patientId, visitId);
            }

            $scope.openDischargePatient = function () {
                $scope.showSubAction = 'openDischargePatient';
            }

            //Add Payment
            $scope.addPayment = function () {
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

            //Remove Payment
            $scope.removePayment = function (ind) {
                $scope.collection.paid_details.splice(ind, 1);
                $scope.calculateTotalPaymentAmount();
            }

            //Calculate Total Payment
            $scope.calculateTotalPaymentAmount = function () {
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

            //Save Payment
            $scope.savePayment = function () {

                for (var i in $scope.collection.paid_details) {
                    if ($scope.collection.paid_details[i].bill_id == undefined || $scope.collection.paid_details[i].bill_id == '') {
                        swal("Select Bill Category");
                        return;
                    }
                }

                $scope.collection.dr_id = $scope.doctorId;
                $scope.collection.patient_id = $scope.patientid;
                $scope.collection.p_visit_id = $scope.visitId;
                $scope.collection.user_id = $scope.login_data.edwise.uid;

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
                    $scope.receiptDetails = res.data;
                    //console.table($scope.receiptDetails);
                    for (var i in $scope.receiptDetails) {
                        for (var j in $scope.receiptDetails[i].paid_details) {
                            $scope.receiptDetails[i].paid_details[j].amount = Number($scope.receiptDetails[i].paid_details[j].amount);
                        }
                    }
                    //console.table($scope.receiptDetails);
                    //$scope.action = 3;
                    $('#receiptDetailsModal').modal('show');
                });
                $medwiseLog.save('Collection', data);
            }
            $scope.get_history = function () {
                $scope.init();
                $scope.showSubAction = 'displayBills';
            }

            //Select Bill Category For Collection
            $scope.selectBillCategoryForCollection = function (obj, ind) {
                $scope.collection.paid_details[ind].bill_id = obj.bcid;
            }

            //Select Tests
            $scope.selectInvestigationsForLabPayment = function (obj, ind) {
                $scope.lab_billing.test[ind].test_id = obj.test_id;
                $scope.lab_billing.test[ind].test_name = obj.test_name;
                $scope.lab_billing.test[ind].paid_amount = obj.price;
                $scope.lab_billing.test[ind].ref_values = JSON.parse(obj.ref_values);
                $scope.calculateTotalLabPaymentAmount();
            }

            //Calculate Total Lab Payment Amount
            $scope.calculateTotalLabPaymentAmount = function () {
                $scope.addBtnDisable_for_bill = 'no';
                $scope.lab_billing.total_paid_amount = 0;
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

            //Add Lab Payment
            $scope.addInvestigationForLabPayment = function () {
                var temp = {};
                $scope.lab_billing.test.push(temp);
                $scope.addBtnDisable_for_bill = 'yes';
            }

            //Remove Investigations
            $scope.removeInvestigationForLabPayment = function (ind) {
                $scope.lab_billing.test.splice(ind, 1);
                $scope.calculateTotalLabPaymentAmount();
            }

            //Auto Fill Records
            $scope.AutoFillInvestigations = function (ind) {
                $scope.lab_billing.test = [];
                for (var z in $scope.inpatientInvestigations[ind].investigationsPerformed) {
                    $scope.lab_billing.test.push($scope.inpatientInvestigations[ind].investigationsPerformed[z]);
                }

                for (var i in $scope.inpatientInvestigations[ind].investigationsPerformed) {
                    //console.log($scope.inpatientInvestigations[ind].investigationsPerformed);
                    $scope.lab_billing.test.push();
                    for (var j in $scope.test_data) {
                        if ($scope.inpatientInvestigations[ind].investigationsPerformed[i].test_id == $scope.test_data[j].test_id) {
                            $scope.lab_billing.test[i].obj = $scope.test_data[j];
                            $scope.lab_billing.test[i].paid_amount = $scope.test_data[j].price;
                            $scope.lab_billing.test[i].test_id = $scope.test_data[j].test_id;
                            $scope.lab_billing.test[i].test_name = $scope.test_data[j].test_name;
                            //$scope.lab_billing.test[i].ref_values = JSON.parse($scope.test_data[j].ref_values);
                        }
                    }
                }
                $scope.calculateTotalLabPaymentAmount();
            }

            //Save Lab Payment
            $scope.saveLabPayment = function () {
                for (var i in $scope.lab_billing.test)
                    if ($scope.lab_billing.test[i].test_id == undefined) {
                        swal("Select Test");
                        return;
                    }
                for (var j in $scope.lab_billing.test) {
                    delete $scope.lab_billing.test[j].obj;
                }

                $scope.lab_billing.dr_id = $scope.doctorId;
                $scope.lab_billing.patient_id = $scope.patientid;
                $scope.lab_billing.p_visit_id = $scope.visitId;
                $scope.lab_billing.user_id = $scope.login_data.edwise.uid;

                var data = $.param({
                    lab_billing_data: $scope.lab_billing
                });

                //console.log($scope.lab_billing);
                var config = {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                    }
                }
                $http.post("../php/collection.php?action=add_test_lab_billing", data, config).then(function OnSuccess(res, status, header, config) {
                    $scope.receiptDetails = res.data;
                    $('#receiptDetailsModal').modal('show');
                });
                //$medwiseLog.save('Users','extra Data');
            };

            //Place ToolTip For Beds
            $scope.placeToolTip = function (data) {
                for (var block_index in data.blocks) {
                    for (var room_index in data.blocks[block_index].rooms) {
                        for (var bed_index in data.blocks[block_index].rooms[room_index].beds) {
                            if (data.blocks[block_index].rooms[room_index].beds[bed_index].patient_id !== "") {
                                $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-toggle', 'tooltip');
                                $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-placement', 'top');
                                $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-title', 'Patient_id = ' + data.blocks[block_index].rooms[room_index].beds[bed_index].patient_id);
                                $('[data-toggle="tooltip"]').tooltip();
                            }
                        }
                    }
                }
            }

            //Select Bed
            $scope.selectBed = function (b_id, rentAmount, is_allocated, idx) {
                // alert("patient id = " + $scope.hold + "   You Selected Bed ID " + b_id);
                // alert(is_allocated);
                if (is_allocated == 0) {
                    if ($scope.pre_index != "") {
                        $("#" + $scope.pre_index).css("color", "#27c24c");
                    }
                    $scope.roomChange.bed_id = b_id;
                    $scope.roomChange.rentAmount = rentAmount;
                    $scope.roomChange.user_id = $scope.login_data.edwise.uid;
                    $("#" + idx).css("color", "#7f2c7f");
                    $scope.pre_index = idx;
                } else {
                    swal('Bed is Already Reserved');
                }
                $medwiseLog.save('InPatient', 'Bed Section');
            }

            //Room Changing For Patient
            $scope.changeRoomOfPatient = function () {

                if ($scope.roomChange.bed_id === undefined) {
                    swal("Select Bed");
                } else {
                    var data = $.param({
                        roomChange: $scope.roomChange
                    });
                    var config = {
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                        }
                    };
                    $http.post('../php/room_allotment.php?action=change_room', data, config).then(function OnSuccess(res, config, status, header) {
                        var p_id = $scope.patientDetails.patient_id;

                        $medwiseLog.save('InPatient', 'Bed Section');
                        // $route.reload();
                        // $scope.patientIdForDetails = p_id ;

                        // $scope.action = 'showIpDetailsForm';
                        $scope.init();
                        //$scope.showSubAction = '';
                    });
                }
            }

            //Load Bill Settlement
            $scope.loadFinalBillSettlement = function (patientId, visitId) {

                $scope.patientIdForDischargePatient = patientId;
                $scope.visitIdForDischargePatient = visitId;
                $scope.totalRoomAmount = 0;
                $scope.totalDoctorVisitAmount = 0;
                $scope.labInvestigationsAmount = 0;
                $scope.totalDueAmountOfVisit = 0;
                $scope.investigationsThere = false;
                $scope.billSettlementDateOfVisit = new Date();
                $scope.billSettlementDateOfVisitForDb = $scope.billSettlementDateOfVisit.toLocaleDateString('en-US', {
                    day: "2-digit",
                    month: "long",
                    year: "numeric",
                    hour: "2-digit",
                    minute: "2-digit",
                    second: "2-digit",
                    hour12: false
                });
                $scope.discountAmountOfVisit = 0;
                $scope.labTestAmount = 0;

                $http.get("../php/final_billing.php?action=getRoomDetailsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
                    $scope.roomDetailsOfVisit = res.data;

                    if (!Array.isArray($scope.roomDetailsOfVisit)) {
                        $scope.roomDetailsOfVisit = [];
                    }
                    //console.log($scope.roomDetailsOfVisit);

                    $scope.reloadVacatedDates();
                    $scope.calcTotalRoomAmount();
                });

                $http.get("../php/final_billing.php?action=getAllDoctorDetailsOfVisit&visitId=" + visitId).then(function OnSuccess(res) {
                    $scope.visitedDoctorDetails = res.data;
                    //console.log($scope.visitedDoctorDetails);

                    if (!Array.isArray($scope.visitedDoctorDetails)) {
                        $scope.visitedDoctorDetails = [];
                    }
                    $scope.cumulativeDoctorVisitsArray = [];
                    for (var i in $scope.visitedDoctorDetails) {

                        var isDoctorVisitCounted = false;
                        for (var k in $scope.cumulativeDoctorVisitsArray) {
                            if ($scope.cumulativeDoctorVisitsArray[k].visitedDoctor === $scope.visitedDoctorDetails[i].visitedDoctor && $scope.cumulativeDoctorVisitsArray[k].consultationType === $scope.visitedDoctorDetails[i].consultationType) {
                                isDoctorVisitCounted = true;
                            }
                        }

                        if (!isDoctorVisitCounted) {
                            var count = 1;
                            for (var j in $scope.visitedDoctorDetails) {

                                if (i !== j) {
                                    if ($scope.visitedDoctorDetails[i].visitedDoctor === $scope.visitedDoctorDetails[j].visitedDoctor && $scope.visitedDoctorDetails[i].consultationType === $scope.visitedDoctorDetails[j].consultationType) {
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

                    if (!Array.isArray($scope.testDetailsOfVisit)) {
                        $scope.testDetailsOfVisit = [];
                    }

                    for (var i in $scope.testDetailsOfVisit) {
                        $scope.testDetailsOfVisit[i].investigationsPerformed = JSON.parse($scope.testDetailsOfVisit[i].investigationsPerformed);

                        var visitInvestigationsAmount = 0;
                        for (var j in $scope.testDetailsOfVisit[i].investigationsPerformed) {
                            if ($scope.testDetailsOfVisit[i].investigationsPerformed[j] !== null) {
                                //console.log($scope.testDetailsOfVisit[i].investigationsPerformed[j]);
                                if (Number($scope.testDetailsOfVisit[i].investigationsPerformed[j].price) > 0) {
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
                    for (var i in $scope.paidDetailsOfVisit) {
                        if ($scope.paidDetailsOfVisit[i] !== null) {
                            $scope.totalPaidAmountOfVisit += Number($scope.paidDetailsOfVisit[i].amount);
                        }
                    }

                    // for(var j in $scope.testDetailsOfVisit) {

                    // }
                    //console.log($scope.testDetailsOfVisit);
                });
            }

            //Reload charges after discharge date has been changed
            $scope.reloadVacatedDates = function () {

                $scope.billSettlementDateOfVisitForDb = $scope.billSettlementDateOfVisit.toLocaleDateString('en-US', {
                    day: "2-digit",
                    month: "long",
                    year: "numeric",
                    hour: "2-digit",
                    minute: "2-digit",
                    second: "2-digit",
                    hour12: false
                });

                $scope.cumulativeRoomsArray = [];
                for (var i in $scope.roomDetailsOfVisit) {

                    var isRoomCounted = false;
                    for (var k in $scope.cumulativeRoomsArray) {
                        if ($scope.cumulativeRoomsArray[k].bedId === $scope.roomDetailsOfVisit[i].bedId) {
                            isRoomCounted = true;
                        }
                    }

                    if (!isRoomCounted) {

                        if ($scope.roomDetailsOfVisit[i].vacatedDate === null) {

                            var enteredDate = new Date($scope.roomDetailsOfVisit[i].enteredDate);
                            var vacatedDate = new Date($scope.billSettlementDateOfVisit);
                            $scope.roomDetailsOfVisit[i].vacatedDate = vacatedDate;

                            var enteredDateTimeStamp = enteredDate.getTime();
                            var vacatedDateTimeStamp = vacatedDate.getTime();

                            var timeStampDifference = Math.abs(enteredDateTimeStamp - vacatedDateTimeStamp);
                            var differenceInDays = Math.ceil(timeStampDifference / (3600 * 24 * 1000));

                            if (differenceInDays === 0) {
                                differenceInDays++;
                            }

                            noOfDays = Number(differenceInDays);
                        } else {
                            noOfDays = Number($scope.roomDetailsOfVisit[i].noOfDays);
                        }

                        for (var j in $scope.roomDetailsOfVisit) {

                            if (i !== j) {
                                if ($scope.roomDetailsOfVisit[i].bedId === $scope.roomDetailsOfVisit[j].bedId) {
                                    if ($scope.roomDetailsOfVisit[j].vacatedDate !== null) {
                                        noOfDays += Number($scope.roomDetailsOfVisit[j].noOfDays);
                                    } else {
                                        var enteredDate = new Date($scope.roomDetailsOfVisit[j].enteredDate);
                                        var vacatedDate = new Date($scope.billSettlementDateOfVisit);
                                        $scope.roomDetailsOfVisit[j].vacatedDate = vacatedDate;

                                        var enteredDateTimeStamp = enteredDate.getTime();
                                        var vacatedDateTimeStamp = vacatedDate.getTime();

                                        var timeStampDifference = Math.abs(enteredDateTimeStamp - vacatedDateTimeStamp);
                                        var differenceInDays = Math.ceil(timeStampDifference / (3600 * 24 * 1000));

                                        if (differenceInDays === 0) {
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
                        console.log($scope.roomDetailsOfVisit[i].noOfDays);
                        $scope.cumulativeRoomsArray.push($scope.roomDetailsOfVisit[i]);
                    }
                }
            }

            //Calculate Total Room Amount
            $scope.calcTotalRoomAmount = function () {

                $scope.totalRoomAmount = 0;
                for (var i in $scope.cumulativeRoomsArray) {
                    if ($scope.cumulativeRoomsArray[i].noOfDays !== undefined) {
                        $scope.totalRoomAmount += Number($scope.cumulativeRoomsArray[i].roomRentAmount) * Number($scope.cumulativeRoomsArray[i].noOfDays);
                    }
                }
            }

            //Calculate Total Doctor Amount
            $scope.calcTotalDoctorVisitAmount = function () {
                $scope.totalDoctorVisitAmount = 0;
                for (var i in $scope.cumulativeDoctorVisitsArray) {
                    if ($scope.cumulativeDoctorVisitsArray[i].count !== undefined) {
                        $scope.totalDoctorVisitAmount += Number($scope.cumulativeDoctorVisitsArray[i].amount) * Number($scope.cumulativeDoctorVisitsArray[i].count);
                    }
                }
            }

            //Assign Discount Amount
            $scope.assignDiscountAmount = function (value) {
                $scope.discountAmountOfVisit = value;
            }

            //Show Breakups For Room
            $scope.showBreakUpsOfRoom = function (bedId) {

                $scope.bedIdForDetailsModal = bedId;
                $('#roomDetailsOfVisitModal').modal('show');
            }

            //Show Breakups For Doctor
            $scope.showBreakUpsOfDoctor = function (drId, consultationType) {

                $scope.doctorIdForDetailsModal = drId;
                $scope.consultationTypeForDetailsModal = consultationType;
                $('#doctorDetailsOfVisitModal').modal('show');
            }

            $scope.showBreakUpsOfInvestigations = function () {}

            //Save Bill Settlement Data
            $scope.saveFinalSettlementBillData = function () {

                var data = $.param({
                    roomDetailsOfVisit: $scope.cumulativeRoomsArray,
                    doctorDetailsOfVisit: $scope.cumulativeDoctorVisitsArray,
                    visitId: $scope.visitIdForDischargePatient,
                    patientId: $scope.patientIdForDischargePatient,
                    investigationChargeOfVisit: $scope.labInvestigationsAmount,
                    dischargeDate: $scope.billSettlementDateOfVisitForDb,
                    discountAmountOfVisit: $scope.discountAmountOfVisit,
                    userId: $scope.login_data.edwise.uid
                });

                var log_data = data;
                var config = {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                    }
                };


                var temp = {
                    roomDetailsOfVisit: $scope.cumulativeRoomsArray,
                    doctorDetailsOfVisit: $scope.cumulativeDoctorVisitsArray,
                    visitId: $scope.visitIdForDischargePatient,
                    patientId: $scope.patientIdForDischargePatient,
                    investigationChargeOfVisit: $scope.labInvestigationsAmount,
                    dischargeDate: $scope.billSettlementDateOfVisitForDb,
                    discountAmountOfVisit: $scope.discountAmountOfVisit,
                    userId: $scope.login_data.edwise.uid
                };

                console.log(temp);

                /*$http.post("../php/discharge_summary.php?action=addFinalSettlement", data, config).then(function OnSuccess(res, status, header, config) {
                    //console.log(res.data);
                    $route.reload();
                });*/
            }

            //Save Discharge Data
            $scope.saveDischargeData = function () {

                //$scope.dischargeSummary = CKEDITOR.instances['dischargeSummary'].getData();
                var formData = new FormData();
                formData.append('dischargeFiles', $scope.files);
                formData.append('patientId', $scope.patientid);
                formData.append('visitId', $scope.visitId);
                formData.append('dischargeSummary', $scope.dischargeSummary);
                formData.append('diagnosisTreatmentBy', $scope.diagnosisTreatmentBy);
                formData.append('dischargeAdvise', $scope.dischargeAdvise);
                formData.append('dischargeDate', $scope.dischargeDateOfVisitForDb);
                formData.append('userId', $scope.login_data.edwise.uid);

                var config = {
                    transformRequest: angular.identity,
                    headers: {
                        'Content-Type': undefined,
                        'Process-Data': false
                    }
                };

                $http.post("../php/discharge_summary.php?action=dischargePatient", formData, config).then(function OnSuccess(res) {
                    //console.log(res.data);
                    $route.reload();
                });
            }

            //Get Details By Receipt Code
            $scope.getDetailsByReceiptCode = function (receiptCode) {

                $http.get("../php/collection.php?action=get_receipt_details&receipt_code=" + receiptCode).then(function OnSuccess(res) {
                    $scope.receiptDetails = res.data;
                    $scope.total = 0;
                    for (var i in $scope.receiptDetails) {
                        for (var j in $scope.receiptDetails[i].paid_details) {
                            $scope.receiptDetails[i].paid_details[j].amount = Number($scope.receiptDetails[i].paid_details[j].amount);
                        }
                    }

                    $('#receiptDetailsModal').modal('show');
                    //console.log($scope.receiptDetails);
                    //console.table($scope.receiptDetails);
                });

            }

            $scope.alertHai = function () {
                alert();
            }

            //Print Content
            $scope.printContent = function (container) {

                var mywindow = window.open('', 'PRINT', 'height=800,width=1200');
                mywindow.document.write('<html><head><title>' + document.title + '</title>');
                //mywindow.document.write('</head><body >');
                //mywindow.document.write('<h1>' + document.title  + '</h1>');
                mywindow.document.write(document.getElementById(container).innerHTML);
                mywindow.document.write('</body></html>');

                mywindow.document.close(); // necessary for IE >= 10
                mywindow.focus(); // necessary for IE >= 10*/

                mywindow.print();
                mywindow.close();

                return true;
            }
        },
        templateUrl: "tpl_ip.html"
    }
}]);

angular.module('medwise').directive('patientlist', ['$http', function ($http) {
    return {
        restrict: 'E',
        scope: {
            controller: '=controller'
        },
        controller: function ($scope) {
            //console.log($scope.controller);

            // Get all inpatient details.
            $http.get('../php/patient_info.php?action=active_ip_visits').then(function (res) {
                $scope.patientList = res.data;
            });
        },
        templateUrl: "tpl_patient_list.html"
    }
}]);

angular.module('medwise').directive('oplist', ['$http', function ($http) {
    return {
        restrict: 'E',
        scope: {
            controller: '=controller'
        },
        controller: function ($scope) {
            //console.log($scope.controller);

            // Get all inpatient details.
            $http.get('../php/patient_info.php?action=specificdate_op_visits&op_date=' + $scope.date).then(function (res) {
                $scope.opPatientList = res.data;
                //console.log($scope.opPatientList);
            });
        },
        templateUrl: "tpl_op_patient_list.html"
    }
}]);

angular.module('medwise').directive('oplist1', ['$http', function ($http) {
    return {
        restrict: 'E',
        scope: {
            data: '=data'
        },
        controller: function ($scope) {

            console.log($scope.data);


            $http.get("../php/patient_info.php?action=specificdate_op_visits&from_date=" + $scope.data.fromdate + "&to_date=" + $scope.data.todate).then(function OnSuccess(res) {
                $scope.op = res.data;
                console.log($scope.op);
            });

        },
        templateUrl: "tpl_oplist.html"
    }
}]);








//Ussage:   <ipdetails patientid="1"></ipdetails>
