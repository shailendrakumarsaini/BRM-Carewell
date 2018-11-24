angular.module('medwise').controller('dailycashregister_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.cashTotal = 0;
    $scope.chequeTotal = 0;
    $scope.swipingTotal = 0;
    $scope.dayTotal = 0;
    $scope.PrintShow = 0;


        $scope.change_from_date = function(){
            var splitDate = $scope.from_date_for_model.split("/");
            $scope.from_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
            //alert($scope.from_date)
            $scope.change_date();
        }

        $scope.change_to_date = function(){
            var splitDate = $scope.to_date_for_model.split("/");
            $scope.to_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
            //alert($scope.to_date)
            $scope.change_date();
        }

        $scope.init = function () {
            $scope.DoNotShow = 1;
            $scope.from_date_for_model = new Date();
            $scope.from_date = $scope.from_date_for_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });

            $scope.to_date_for_model = new Date();
            $scope.to_date = $scope.to_date_for_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });

            //console.log($scope.from_date+ ' '+$scope.to_date)
            $http.get("../php/daily_collection_reg.php?action=get_specificedate_bill_register&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                $scope.data = res.data;
                //console.log($scope.data);
                if (Array.isArray($scope.data))
                {
                    $scope.dayTotal = 0;
                    $scope.cashTotal = 0;
                    $scope.swipingTotal = 0;
                    $scope.chequeTotal = 0;
                    for(var j in $scope.data)
                    {
                        $scope.data[j].patient_id = Number($scope.data[j].patient_id);
                        $scope.data[j].amount = Number($scope.data[j].amount);
                        $scope.dayTotal = $scope.dayTotal + Number($scope.data[j].amount);
                        if($scope.data[j].payment_type === 'Cash'){
                            $scope.cashTotal = $scope.cashTotal + Number($scope.data[j].amount);
                        }
                        if($scope.data[j].payment_type === 'Card'){
                            $scope.swipingTotal = $scope.swipingTotal + Number($scope.data[j].amount);
                        }
                        if($scope.data[j].payment_type === 'Cheque'){
                            $scope.chequeTotal = $scope.chequeTotal + Number($scope.data[j].amount);
                        }
                    }
                    // console.log($scope.dayTotal);
                    // console.log($scope.cashTotal);
                    // console.log($scope.swipingTotal);
                    // console.log($scope.chequeTotal);

                    $scope.show = 1;
                } else{
                    $scope.data = [];
                    $scope.show = 0;
                }


                $http.get("../php/daily_collection_reg.php?action=get_specificedate_cancelled_receipts&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                    $scope.cancel_data = res.data;
                    //console.table($scope.cancel_data);
                    if (Array.isArray($scope.cancel_data))
                        {
                            for (var i in $scope.cancel_data) {
                                $scope.cancel_data[i].patient_id = Number($scope.cancel_data[i].patient_id);
                                $scope.cancel_data[i].amount = Number($scope.cancel_data[i].amount);
                            }
                        $scope.cancel_show = 1;
                    } else{
                        $scope.cancel_data = [];
                        $scope.cancel_show = 0;
                    }

                    //if(!Array.isArray($scope.data) && !Array.isArray($scope.cancel_data)){
                    if($scope.show == 0 && $scope.cancel_show == 0){
                        $scope.DoNotShow = 1;
                        $(document).ready(function(){
                            $('#printid').hide();
                        });
                    }else{
                        $scope.DoNotShow = 0;
                        $(document).ready(function(){
                            $('#printid').show();
                        });
                    }
                });
            });

            $http.get("../php/hospital.php?action=get_main_hospital_details").then(function OnSuccess(res) {
                $scope.hospital_details = res.data;
                //console.table($scope.hospital_details);
            });
            $scope.action = 1;
            $medwiseLog.save('Users', 'extra Data');
        }

        $scope.change_date = function () {
            $scope.DoNotShow = 1;
            $scope.to_date = $scope.to_date_for_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
            $scope.from_date = $scope.from_date_for_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
            //console.log($scope.from_date+ ' '+$scope.to_date)
            $http.get("../php/daily_collection_reg.php?action=get_specificedate_bill_register&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                $scope.data = res.data;
                //console.log($scope.data);
                if (Array.isArray($scope.data)) {
                    $scope.show = 1;
                    $scope.dayTotal = 0;
                    $scope.cashTotal = 0;
                    $scope.swipingTotal = 0;
                    $scope.chequeTotal = 0;
                    for(var j in $scope.data) {
                        $scope.data[j].amount = Number($scope.data[j].amount);
                        $scope.data[j].patient_id = Number($scope.data[j].patient_id);
                        $scope.dayTotal = $scope.dayTotal + Number($scope.data[j].amount);
                        if($scope.data[j].payment_type === 'Cash'){
                            $scope.cashTotal = $scope.cashTotal + Number($scope.data[j].amount);
                        }
                        if($scope.data[j].payment_type === 'Card'){
                            $scope.swipingTotal = $scope.swipingTotal + Number($scope.data[j].amount);
                        }
                        if($scope.data[j].payment_type === 'Cheque'){
                            $scope.chequeTotal = $scope.chequeTotal + Number($scope.data[j].amount);
                        }
                    }
                    // console.log($scope.dayTotal);
                    // console.log($scope.cashTotal);
                    // console.log($scope.swipingTotal);
                    // console.log($scope.chequeTotal);

                } else {
                    $scope.data = [];
                    $scope.show = 0;
                }

                $http.get("../php/daily_collection_reg.php?action=get_specificedate_cancelled_receipts&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                    $scope.cancel_data = res.data;
                    //console.log($scope.cancel_data);
                    if (Array.isArray($scope.cancel_data))
                    {
                        for(var i in $scope.cancel_data){
                            $scope.cancel_data[i].patient_id = Number($scope.cancel_data[i].patient_id);
                            $scope.cancel_data[i].amount = Number($scope.cancel_data[i].amount);
                        }
                        $scope.cancel_show = 1;
                    } else {
                        $scope.cancel_data = [];
                        $scope.cancel_show = 0;
                    }
                    //console.table($scope.data);


                    //if(!Array.isArray($scope.data) && !Array.isArray($scope.cancel_data)){
                    if($scope.show == 0 && $scope.cancel_show == 0){
                        $scope.DoNotShow = 1;
                        $(document).ready(function(){
                            $('#printid').hide();
                        });

                    }else{
                        $scope.DoNotShow = 0;
                        $(document).ready(function(){
                            $('#printid').show();
                        });
                    }
                });
            });
            $medwiseLog.save('Users', 'extra Data');
        }

        $scope.get_print = function() {

                $scope.action = 1;
                $http.get("../php/daily_collection_reg.php?action=get_specificedate_bill_register&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                    $scope.data = res.data;
                    //console.table($scope.data);
                    if (Array.isArray($scope.data))
                    {
                        $scope.dayTotal = 0;
                        $scope.cashTotal = 0;
                        $scope.swipingTotal = 0;
                        $scope.chequeTotal = 0;
                        for(var j in $scope.data) {
                            $scope.data[j].amount = Number($scope.data[j].amount);
                            $scope.dayTotal = $scope.dayTotal + Number($scope.data[j].amount);
                            if($scope.data[j].payment_type === 'Cash'){
                                $scope.cashTotal = $scope.cashTotal + Number($scope.data[j].amount);
                            }
                            if($scope.data[j].payment_type === 'Card'){
                                $scope.swipingTotal = $scope.swipingTotal + Number($scope.data[j].amount);
                            }
                            if($scope.data[j].payment_type === 'Cheque'){
                                $scope.chequeTotal = $scope.chequeTotal + Number($scope.data[j].amount);
                            }
                        }
                        // console.log($scope.dayTotal);
                        // console.log($scope.cashTotal);
                        // console.log($scope.swipingTotal);
                        // console.log($scope.chequeTotal);

                        $scope.show = 1;
                    } else {
                        $scope.data = [];
                        $scope.show = 0;
                    }

                });

                $http.get("../php/daily_collection_reg.php?action=get_specificedate_cancelled_receipts&from_date=" + $scope.from_date + "&to_date=" + $scope.to_date).then(function OnSuccess(res) {
                    $scope.cancel_data = res.data;
                    //console.table($scope.cancel_data);
                    if (Array.isArray($scope.cancel_data))
                        {
                            for (var i in $scope.cancel_data) {
                                $scope.cancel_data[i].amount = Number($scope.cancel_data[i].amount);
                            }
                        $scope.cancel_show = 1;
                    } else {
                        $scope.cancel_data = [];
                        $scope.cancel_show = 0;

                    }
                    //console.table($scope.data);
                });

                $http.get("../php/hospital.php?action=get_main_hospital_details").then(function OnSuccess(res) {
                    $scope.hospital_details = res.data;
                });
                $medwiseLog.save('Users', 'extra Data');
        }

        $scope.print_DCR = function(opp) {
            $scope.PrintShow = 1;
            var mywindow = window.open('', 'PRINT', 'height=full,width=1200');
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

        $scope.get_detailsByRecCode = function (receipt_code, patient_id) {
            $http.get("../php/collection.php?action=get_receipt_details_for_dcr&receipt_code=" + receipt_code + "&patient_id=" + patient_id).then(function OnSuccess(res) {
                $scope.indivisual_receipt = res.data;
                //console.log($scope.indivisual_receipt);
                $scope.total = 0;
                for(var i in $scope.indivisual_receipt){
                    for(var j in $scope.indivisual_receipt[i].paid_details){
                        $scope.indivisual_receipt[i].paid_details[j].amount = Number($scope.indivisual_receipt[i].paid_details[j].amount);
                    }
                }
            });
        }

        $scope.SortTheData = function (temp) {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }
   

});
