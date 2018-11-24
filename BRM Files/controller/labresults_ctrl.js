angular.module('medwise').controller('labresults_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
	$scope.PrintShow = 0;
	$scope.lineCount = 0;

	$scope.init=function() {
        $scope.action = 1;
        $scope.tempDateModelFromDate = new Date();
        $scope.tempDateModelToDate = new Date();
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        $http.get("../php/case_sheet.php?action=specific_date_cs&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
            $scope.lab_data = res.data;
            //console.log($scope.lab_data);
            var notNullData = false;

            if(Array.isArray($scope.lab_data)){
                $scope.NoData = 0;

                for(var i in $scope.lab_data) {
                    $scope.lab_data[i].inv_details = JSON.parse($scope.lab_data[i].inv_details);
                    $scope.lab_data[i].investigationResults = JSON.parse($scope.lab_data[i].investigationResults);

                    if($scope.lab_data[i].inv_details !== null) {
                        notNullData = true;
                    }

                    /*$scope.lab_data[i].isResultGiven = true;
                    for(var j in $scope.lab_data[i].inv_details) {
                        if($scope.lab_data[i].inv_details[j].result === undefined || $scope.lab_data[i].inv_details[j].result === '') {
                            $scope.lab_data[i].isResultGiven = false;
                            break;
                        }
                    }*/
                }
            } else{
                $scope.lab_data = [];
                $scope.NoData = 1;
            }

            if(!notNullData) {
                $scope.NoData = 1;
            }
            //console.table($scope.lab_data);
		});
		//$medwiseLog.save('Users','extra Data');
    }

    $scope.byDate = function()
        {
            $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
            $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
            $http.get("../php/case_sheet.php?action=specific_date_cs&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
                $scope.lab_data = res.data;
                //console.log($scope.lab_data);
                var notNullData = false;

                if(Array.isArray($scope.lab_data)){
                    $scope.NoData = 0;

                    for(var i in $scope.lab_data) {
                        $scope.lab_data[i].inv_details = JSON.parse($scope.lab_data[i].inv_details);
                        $scope.lab_data[i].investigationResults = JSON.parse($scope.lab_data[i].investigationResults);

                        if($scope.lab_data[i].inv_details !== null) {
                            notNullData = true;
                        }

                        /*$scope.lab_data[i].isResultGiven = true;
                        for(var j in $scope.lab_data[i].inv_details) {
                            if($scope.lab_data[i].inv_details[j].result === undefined || $scope.lab_data[i].inv_details[j].result === '') {
                                $scope.lab_data[i].isResultGiven = false;
                                break;
                            }
                        }*/
                    }
                } else{
                    $scope.lab_data = [];
                    $scope.NoData = 1;
                }

                if(!notNullData) {
                    $scope.NoData = 1;
                }
                //console.table($scope.lab_data);
            });
            //$medwiseLog.save('Date Change','');
        }    

    $scope.openTestResult = function(caseSheetId) {

        $http.get("../php/case_sheet.php?action=getTestDetailsOfCaseSheet&caseSheetId=" + caseSheetId).then(function OnSuccess(res){
            //console.log(res.data);
            $scope.test_result = res.data[0];
            //console.log($scope.test_result);
            $scope.action = 2;


            for(var j in $scope.test_result.investigationResults) {

                var tempArray = [];

                if($scope.test_result.investigationResults[j].ref_values[0].remarks !== undefined) {

                    var remarks = $scope.test_result.investigationResults[j].ref_values[0].remarks;
                } else {
                    var remarks = null;
                }

                for(var k in $scope.test_result.investigationResults[j].ref_values) {

                    if(($scope.test_result.investigationResults[j].ref_values[k].Gender === $scope.test_result.gender) || ($scope.test_result.investigationResults[j].ref_values[k].Gender === 'All')) {

                        var obj = $scope.test_result.investigationResults[j].ref_values[k];

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

                $scope.test_result.investigationResults[j].ref_values = [];
                $scope.test_result.investigationResults[j].ref_values = tempArray;

                if(remarks !== null && remarks !== '') {

                    $scope.test_result.investigationResults[j].ref_values[0].remarks = remarks;
                }

                // console.log(removeKeys);
                // for(var z in removeKeys) {
                //     console.log(removeKeys[z]);
                //     $scope.test_result[i].investigationResults[j].ref_values.splice(removeKeys[z], 1);
                // }
            }

        });
    }

    $scope.save_test_results = function(){

        $scope.test_result.user_id = $scope.login_data.edwise.uid;
        //console.log($scope.test_result);

        var data = $.param({ investigationResults : $scope.test_result });
        var config = { headers : {'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'} };
        $http.post("../php/case_sheet.php?action=update_investigations",data,config).then(function OnSuccess(res,config,status,header){
            //console.log(res.data);
            $route.reload();
        });
    }

    $scope.printLabResult = function(opp) {
						$scope.PrintShow = 1;
            var mywindow = window.open('', 'PRINT', 'height=full,width=full');
            mywindow.document.write('<html><head><title>' + document.title + '</title>');
            //mywindow.document.write('</head><body >');
            //mywindow.document.write('<h1>' + document.title  + '</h1>');
            mywindow.document.write(document.getElementById(opp).innerHTML);
            mywindow.document.write('</body></html>');

            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10*/

            mywindow.print();
            mywindow.close();
						$scope.PrintShow = 0;
            return true;
        }

    $scope.getDetailsOfInvestigations = function(caseSheetId) {
        //console.log(caseSheetId);
		
		 
        $http.get("../php/case_sheet.php?action=getTestDetailsOfCaseSheet&caseSheetId=" + caseSheetId).then(function OnSuccess(res){
            $scope.testResultDetails = res.data;
			
        });
    }

});
