angular.module('medwise').controller('informationsheet_ctrl', function ($scope, $http, $filter, $window, $route,$location, $medwiseLog) {
	$scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level = parseInt($scope.login_data.edwise.level);

	$scope.init = function() {
        $scope.action = 1;
        $scope.btnAction = 0;
        $scope.currentParams = $route.current.params;
        $scope.informationSheet = {};
        $scope.is = {};
        if($scope.currentParams.patientId !== undefined) {
            $http.get("../php/informationSheet.php?action=getDataOfVisit&visitId=" + $scope.currentParams.visitId).then(function OnSuccess(res) {
               
                $scope.btnAction = 1;

                let sheetData = res.data;
                if(Array.isArray(sheetData)) {
                    $scope.is = JSON.parse(sheetData[0].financeDetails);
                    console.log($scope.is);
                    $scope.is.notes = sheetData[0].notes;

                    $scope.is.ptdetails.admit_date = new Date($scope.is.ptdetails.admit_date);

                    $scope.is.physician.tempDate = new Date($scope.is.physician.tempDate);
                  
                    if($scope.is.physician !== undefined) {
                        if($scope.is.physician.paid === "true") {
                            $scope.is.physician.paid = true;
                        } else {
                            $scope.is.physician.paid = false;
                        }

                       /*  $scope.is.physician.tempDate = convert($scope.is.physician.tempDate);
                        $scope.is.physician.tempDate =  formatDate($scope.is.physician.tempDate); */
                    }

                    $scope.is.Surgen.tempDate = new Date($scope.is.Surgen.tempDate);

                    if($scope.is.Surgen !== undefined) {
                        if($scope.is.Surgen.paid === "true") {
                            $scope.is.Surgen.paid = true;
                        } else {
                            $scope.is.Surgen.paid = false;
                        }
                    }

                    $scope.is.Anesthesian.tempDate = new Date($scope.is.Anesthesian.tempDate);

                    if($scope.is.Anesthesian !== undefined) {
                        if($scope.is.Anesthesian.paid === "true") {
                            $scope.is.Anesthesian.paid = true;
                        } else {
                            $scope.is.Anesthesian.paid = false;
                        }
                    }

                    $scope.is.referral.tempDate = new Date($scope.is.referral.tempDate);

                    if($scope.is.referral !== undefined) {
                        if($scope.is.referral.paid === "true") {
                            $scope.is.referral.paid = true;
                        } else {
                            $scope.is.referral.paid = false;
                        }
                    }

                    $scope.is.pro.tempDate = new Date($scope.is.pro.tempDate);
                    
                    if($scope.is.pro !== undefined) {
                        if($scope.is.pro.paid === "true") {
                            $scope.is.pro.paid = true;
                        } else {
                            $scope.is.pro.paid = false;
                        }
                    }

                    for(var i in $scope.is.cumulativeConsultants) {
                        $scope.is.cumulativeConsultants[i].tempDate = new Date($scope.is.cumulativeConsultants[i].tempDate);

                        if($scope.is.cumulativeConsultants[i].paid === "true") {
                            $scope.is.cumulativeConsultants[i].paid = true;
                        } else {
                            $scope.is.cumulativeConsultants[i].paid = false;
                        }
                    }
                } else {
                    $http.get("../php/patient_info.php?action=ipDetailsOfpatient&patient_id=" + $scope.currentParams.patientId).then(function OnSuccess(res) {
                       
                        let d = res.data[0];
                        $scope.btnAction = 2;
        
                        $scope.is.ptdetails = {
                            "patientId": d.patient_id,
                            "name": d.name,
                            "visitId": d.p_visit_id,
                            "mobile": d.mobile,
                            "city": d.city,
                            "age": d.age,
                            "father_name": d.father_name,
                            "gender": d.gender,
                            "package_or_regular": d.package_or_regular,
                            "surgery_or_medical": d.surgery_or_medical,
                            "admit_date": new Date(d.admit_date),
                            "schemeName": d.schemeName,
                            "total_package_amount": d.total_package_amount
                        };
                        $scope.is.physician = {
                            "dr_id": d.incharge_doctor_id,
                            "dr_name": d.dr_name,
                            "qualification": d.qualification,
                            "visitCount": d.inchargeVisitCount,
                            "amount": 0,
                            "paid": false,
                            "remarks": "",
                            "tempDate" : ''
                        };
                                
                        if(d.surgeon_doctor_id !== null) {
                            $scope.is.Surgen = {
                                "dr_id": d.surgeon_doctor_id,
                                "dr_name": d.surgeon_dr_name,
                                "qualification": d.surgeon_dr_qualification,
                                "visitCount": d.surgeonVisitCount,
                                "amount": 0,
                                "paid": false,
                                "remarks": "",
                                "tempDate" : ''
                            };
                        }
        
                        if(d.anesthesian_doctor_id !== null) {
                            $scope.is.Anesthesian = {
                                "dr_id": d.anesthesian_doctor_id,
                                "dr_name": d.anesthesian_dr_name,
                                "qualification": d.anesthesian_dr_qualification,
                                "visitCount": d.anesthesianVisitCount,
                                "amount": 0,
                                "paid": false,
                                "remarks": "",
                                "tempDate" : ''
                            };
                        }
        
                        if(d.ref_id !== null) {
                            $scope.is.referral = {
                                "ref_id": d.ref_id,
                                "ref_name": d.ref_name,
                                "ref_city": d.ref_city,
                                "ref_occupation": d.ref_occupation,
                                "amount": 0,
                                "paid": false,
                                "remarks": "",
                                "tempDate" : ''
                            };
                        }
        
                        if(d.pro_id !== null) {
                            $scope.is.pro = {
                                "ref_id": d.pro_id,
                                "ref_name": d.pro_name,
                                "ref_city": d.pro_city,
                                "amount": 0,
                                "paid": false,
                                "remarks": "",
                                "tempDate" : ''
                            };
                        }
        
                        $http.get("../php/case_sheet.php?action=get_previous_counsult_details&visit_id=" + $scope.currentParams.visitId).then(function OnSuccess(res) {
                            $scope.consultantData = res.data;
                            //console.log($scope.consultantData);
                            let consultantData = res.data;
            
                            $scope.is.cumulativeConsultants = [];
                            let doneIds = [];
                            doneIds.push($scope.is.physician.dr_id);
                            if($scope.is.Surgen !== undefined) {
                                doneIds.push($scope.is.Surgen.dr_id);
                            }
            
                            if($scope.is.Anesthesian !== undefined) {
                                doneIds.push($scope.is.Anesthesian.dr_id);
                            }
            
                            for(var i in consultantData) {
            
                                let alreadyInserted = false;
                                angular.forEach(doneIds, (value) => {
                                    if(value == consultantData[i].visitedDoctor) {
                                        alreadyInserted = true;
                                    }
                                });
            
                                if(!alreadyInserted) {
                                    let filterData = $filter('filter')(consultantData, { visitedDoctor : consultantData[i].visitedDoctor });
            
                                    var obj = {
                                        visitCount: filterData.length,
                                        dr_id: filterData[0].visitedDoctor,
                                        dr_name: filterData[0].dr_name,
                                        qualification: filterData[0].qualification,
                                        amount: 0,
                                        paid: false,
                                        remarks: ""
                                    };
            
                                    $scope.is.cumulativeConsultants.push(obj);
                                    doneIds.push(consultantData[i].visitedDoctor);
                                }
                            }
                        });
                    });

                    $http.get("../php/patient_info.php?action=paidAmountOfVisit&visitId=" + $scope.currentParams.visitId).then(function OnSuccess(res) {
                
                        $scope.is.paidDetails = res.data[0];
                    });
                }
            });
            
	        

            $http.get("../php/patient_info.php?action=roomHistoryOfVisit&visitId=" + $scope.currentParams.visitId).then(function OnSuccess(res) {
                
                $scope.is.roomHistory = res.data;
            });
        }
        $medwiseLog.save('Users','extra Data');
        
        
    }
    
    //Save Information Sheet
    $scope.saveInformationSheet = function() {

       // console.log($scope.is);

        $scope.is.userId = $scope.login_data.edwise.uid;
        var data = $.param({
            informationSheet: $scope.is
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        };

        $http.post("../php/informationSheet.php?action=add", data, config).then(function OnSuccess(res, status, header, config) {
            console.log(res.data);
           // $route.reload();
        });
    }

    $scope.redirectToNewPatientPage = function(pid,name){        
        $location.path("/newpaitent").search({
            patientId: pid,     
            name: name,
            action : 'showIpDetailsForm'  
        });
    }
	
});


function convert(str) {
    var mnths = { 
        Jan:"01", Feb:"02", Mar:"03", Apr:"04", May:"05", Jun:"06",
        Jul:"07", Aug:"08", Sep:"09", Oct:"10", Nov:"11", Dec:"12"
    },
    date = str.split(" ");

    return [ date[3], mnths[date[1]], date[2] ].join("-");
}


function formatDate(input) {
    var datePart = input.match(/\d+/g),
    year = datePart[0], // get only two digits
    month = datePart[1], day = datePart[2];
  
    return day+'/'+month+'/'+year;
  }
  