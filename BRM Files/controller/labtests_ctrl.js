angular.module('medwise').controller('labtests_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level = parseInt($scope.login_data.edwise.level);
    $scope.lab_Test = {};
    $scope.lab_Test.input_values = [];
    $scope.lab_Test.input_samples = [];
    $scope.lab_Test.input_consumables = [];
    $scope.ArrayDeleted = 0;
    $scope.selected = {};
    $scope.selected_sample = {};
    $scope.valueType = true;
 
 
    $scope.init = function() {
        $scope.add_values_list();
        $scope.add_samples_list();
        $scope.add_consumables_list();
            $http.get("../php/lab_tests.php?action=get_test_data").then(function OnSuccess(res){
            $scope.load_data=res.data;
            //console.log($scope.load_data);
            if(Array.isArray($scope.load_data)){
                $scope.NoData = 0;
                $scope.tempArr = [];
                for(var i in $scope.load_data) {
                    $scope.load_data[i].consumable_items = JSON.parse($scope.load_data[i].consumable_items);
                    $scope.load_data[i].ref_values = JSON.parse($scope.load_data[i].ref_values);
                    $scope.load_data[i].sample_name = JSON.parse($scope.load_data[i].sample_name);
                    for(var j in $scope.load_data[i].sample_name) {
                        $scope.tempArr.push($scope.load_data[i].sample_name[j].sample);
                    }
                }
            }else{
                $scope.load_data = [];
                $scope.NoData = 1;
            }
            //console.log($scope.tempArr);
            });

            $http.get("../php/lab_tests.php?action=get_test_group_data").then(function OnSuccess(res){
                $scope.test_group_data=res.data;
            });
            $http.get("../php/medicines.php?action=all").then(function OnSuccess(res){
                $scope.items = res.data;
                });
            $http.get("../php/inventory_units.php?act=all").then(function (res){
                $scope.Unites = res.data;
                //console.log($scope.Unites);
            });

            $http.get("../php/lab_tests.php?action=get_test_services").then(function (res){
                $scope.facilityData = res.data;

                if(!Array.isArray($scope.facilityData)) {
                    $scope.facilityData = [];
                }
                //console.log($scope.Unites);
            });

        $scope.action=1;
		//$medwiseLog.save('LabTest','LabTest Page Loaded');
    }

    $scope.add_new_test = function(){
    
        $scope.lab_Test = {};
        $scope.lab_Test.input_values = [];
        $scope.lab_Test.input_samples = [];
        $scope.lab_Test.input_consumables = [];
        $scope.lab_Test.input_values.push({});
        $scope.lab_Test.input_samples.push({});
        $scope.lab_Test.input_consumables.push({});
        $scope.action = 2;
    }

    $scope.show_items = function(obj) {
        $scope.details = [];
        $scope.details.push(obj);   
        //$medwiseLog.save('LabTest','Complete Details of LabTest');
    }

    $scope.update_test = function(obj) {
        
        $scope.lab_Test = {};
        $scope.lab_Test.test_id = obj.lab_test_id;
        $scope.lab_Test.test_service_id = obj.test_service_id;
        $scope.lab_Test.test_group_id = obj.test_group_id;
        $scope.lab_Test.test_name = obj.test_name;
        $scope.lab_Test.input_values = obj.ref_values;
        $scope.lab_Test.input_samples = obj.sample_name;
        $scope.lab_Test.input_consumables = obj.consumable_items;

        //console.log($scope.lab_Test);
        
        for (var i in $scope.lab_Test.input_values) {
            for(var j in $scope.Unites) {
                if($scope.lab_Test.input_values[i].unit_id == $scope.Unites[j].unit_id) {
                    $scope.lab_Test.input_values[i].med_selected = $scope.Unites[j];
                    break;
                }
            }
        }


        for (var i in $scope.lab_Test.input_samples) {
            for(var j in $scope.Unites) {
                if($scope.lab_Test.input_samples[i].unit_id == $scope.Unites[j].unit_id) {
                    $scope.lab_Test.input_samples[i].med_selected_for_samples = $scope.Unites[j];
                    $scope.lab_Test.input_samples[i].suggested_data = [];
                    break;
                }
            }
        }


        for (var i in $scope.lab_Test.input_consumables) {
            for(var j in $scope.items) {
                if($scope.lab_Test.input_consumables[i].med_id == $scope.items[j].med_id) {
                    $scope.lab_Test.input_consumables[i].selected = $scope.items[j];
                    break;
                }
            }
        }

        $scope.action = 4;
        //$scope.lab_Test.input_consumables.selected.item = z.consumable_items;
            
    

        // $http.get("../php/lab_tests.php?action=get_test_group_data").then(function OnSuccess(res){
        //     $scope.test_group_data=res.data;
        // });
        // $http.get("../php/medicines.php?action=all").then(function OnSuccess(res){
        //     $scope.items = res.data;
        //     });
        // $http.get("../php/inventory_units.php?act=all").then(function (res){
        //     $scope.Unites = res.data;
        //     //console.log($scope.Unites);
        // });
    }

    $scope.add_values_list = function() {
        var temp = {};
        $scope.lab_Test.input_values.push(temp);
        //$medwiseLog.save('To Add Values list', '');
    }

    $scope.remove_values_list = function(ind) {
        $scope.lab_Test.input_values.splice(ind,1);
        //$medwiseLog.save('To Remove Values list', ind);
    }

    $scope.add_samples_list = function() {
        var temp = {};
        $scope.lab_Test.input_samples.push(temp);
        //$medwiseLog.save('To Add Samples list', ind);

    }
    
    $scope.remove_samples_list = function(ind)
        {
            $scope.lab_Test.input_samples.splice(ind,1);
            //$medwiseLog.save('To Remove Samples list', ind);
        }

    $scope.add_consumables_list = function()
        {
            var temp = {};
            $scope.lab_Test.input_consumables.push(temp);
            //$medwiseLog.save('To Add Consumables list', ind);

        }
    
    $scope.remove_consumables_list = function(ind)
        {
            $scope.lab_Test.input_consumables.splice(ind,1);
            //$medwiseLog.save('To Remove Consumables list', ind);
        }

    $scope.suggestion = function(j) { 
        // if(samp == '')
        // 	$('p').hide();
        // else
        // 	$('p').show();
        j.suggested_data = $filter('filter')($scope.tempArr, j.sample);
        var uniqueNames = [];
        $.each(j.suggested_data, function(i, el){
            if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
        });

        j.suggested_data = uniqueNames;
        //$medwiseLog.save('To Get Sample Suggestions', qual, j);
    }
       
    $scope.insert_spec = function(qual, j) {
        j.sample = qual;
        delete j.suggested_data;
        $scope.ArrayDeleted = 1;
        //$medwiseLog.save('To Select Sample Suggestions', qual, j);	
    }

    $scope.changeConsume = function(ind) {
        $scope.lab_Test.input_consumables[ind].med_id = $scope.lab_Test.input_consumables[ind].selected.med_id;
        $scope.lab_Test.input_consumables[ind].med_name = $scope.lab_Test.input_consumables[ind].selected.med_name;
        //alert($scope.lab_Test.input_consumables[ind].selected.med_id);
        //delete $scope.lab_Test.input_consumables[ind].selected;
    }

    $scope.MedicineUnit = function(ind) {
        $scope.lab_Test.input_values[ind].unit_id = $scope.lab_Test.input_values[ind].med_selected.unit_id;
        $scope.lab_Test.input_values[ind].unit_name = $scope.lab_Test.input_values[ind].med_selected.unit_name;
    }

    $scope.MedicineUnitfor_samples = function(ind){
        $scope.lab_Test.input_samples[ind].unit_id = $scope.lab_Test.input_samples[ind].med_selected_for_samples.unit_id;
        $scope.lab_Test.input_samples[ind].unit_name = $scope.lab_Test.input_samples[ind].med_selected_for_samples.unit_name;
    }

    $scope.sortTheData = function(temp){
        $scope.reverseSort = ($scope.sort == temp)? !$scope.reverseSort:false;
        $scope.sort = temp;
    }
    
    $scope.save_lab_Test_data = function() {

        for(var i in $scope.lab_Test.input_consumables) {
            if($scope.lab_Test.input_consumables[i].selected == undefined){
                swal('Select Medicine');
                return;
            }
        }

        if($scope.ArrayDeleted == 1) {
            for(var z in $scope.lab_Test.input_samples){
                delete $scope.lab_Test.input_samples[z].suggested_data;
            }
        }

        for(var y in $scope.lab_Test.input_consumables){
            delete $scope.lab_Test.input_consumables[y].selected;
        }

        for(var val_index in $scope.lab_Test.input_values){
            delete $scope.lab_Test.input_values[val_index].med_selected;
        }

        for(var w in $scope.lab_Test.input_samples){
            delete $scope.lab_Test.input_samples[w].med_selected_for_samples;
        }

        $scope.lab_Test.input_samples[0].remarks = $scope.lab_Test.Remarks;

        var data= $.param({ lab_test : $scope.lab_Test });
        var config =  { headers:{ 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        $http.post("../php/lab_tests.php?action=add_test", data, config).then(function OnSuccess(res, status, header, config) {
            //console.log(res.data);
            $route.reload();
            $scope.action = 1;
            });
        $medwiseLog.save('LabTest', data);
    }


    $scope.update_lab_Test_data = function() {

        // for(var i in $scope.lab_Test.input_values) {
        //     if($scope.lab_Test.input_values[i].med_selected == undefined){
        //         swal('Select Units for values');
        //         return;
        //     }
        // }


        // for(var i in $scope.lab_Test.input_samples) {
        //     if($scope.lab_Test.input_samples[i].med_selected_for_samples == undefined){
        //         swal('Select Units for samples');
        //         return;
        //     }
        // }

        for(var i in $scope.lab_Test.input_consumables) {
            if($scope.lab_Test.input_consumables[i].selected == undefined){
                swal('Select Medicine');
                return;
            }
        }

        if($scope.ArrayDeleted == 1) {
            for(var z in $scope.lab_Test.input_samples) {
                delete $scope.lab_Test.input_samples[z].suggested_data;
            }
        }

        for(var y in $scope.lab_Test.input_consumables){
            delete $scope.lab_Test.input_consumables[y].selected;
        }

        for(var x in $scope.lab_Test.input_values){
            delete $scope.lab_Test.input_values[x].med_selected;
        }

        for(var w in $scope.lab_Test.input_samples){
            delete $scope.lab_Test.input_samples[w].med_selected_for_samples;
        }

        var data= $.param({ update_lab_test : $scope.lab_Test });
        var config =  { headers:{ 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        $http.post("../php/lab_tests.php?action=update_test", data, config).then(function OnSuccess(res, status, header, config) {
            //console.log(res.data);
            $route.reload();
            $scope.action = 1;
        });
        $medwiseLog.save('LabTest', data);	
    }




    $scope.add_test_group_data = function()
        {
            //swal($scope.t_group_name);
            var data= $.param({ test_group_name : $scope.t_group_name });
            var log_data = data;
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            $http.post("../php/lab_tests.php?action=add_test_group", data, config).then(function OnSuccess(res, status, header, config) {
                //console.log(res.data);
            });
            $route.reload();
            $medwiseLog.save('Update LabTest', data);
        }


    $scope.resetValues = function(obj) {
        delete obj.startRange;
        delete obj.endRange;
        delete obj.startMinutes;
        delete obj.startSeconds;
        delete obj.endMinutes;
        delete obj.endSeconds;
        delete obj.trueValue;
        delete obj.falseValue;
    }


});

