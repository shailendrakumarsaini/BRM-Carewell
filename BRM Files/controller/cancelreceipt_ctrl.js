angular.module('medwise').controller('cancelreceipt_ctrl', function ($scope,$http,$filter,$window,$location,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
    $scope.action=1;
    $scope.user_id = $scope.login_data.edwise.uid;

    $scope.show_rec = function(recno)
        {

            $http.get("../php/collection.php?action=get_receipt_details&receipt_code=" + recno).then(function OnSuccess(res) {
                $scope.rec_data =res.data;
                //console.table($scope.rec_data);
                if(Array.isArray($scope.rec_data))
                    {
                        $scope.showrec = 1;
                        $scope.norec = 1;
                        var date = new Date();
                        var day = date.getDate();
                        if(day < 10) {day = '0' + day;}
                        var month = date.getMonth() + 1;
                        if(month < 10) {month = '0' + month;}
                        var year = date.getFullYear();
                        var todate =  day  + "-" + month + "-" + year;

                        if(todate == $scope.rec_data[0].date_time){
                            $scope.btnEnalbe = 1;
                        }else{
                            $scope.btnEnalbe = 0;
                        }
                    }else{
                        $scope.norec = 0;
                    }
                        });
                        $medwiseLog.save('CancelRec', "Get Receipt data");
        }

    $scope.cancel_rec = function(receipt_code){
        $http.get("../php/collection.php?action=cancel_receipt&receipt_code=" + receipt_code + "&user_id=" + $scope.user_id).then(function OnSuccess(res){
            $scope.data = res.data;
            //console.log($scope.data);
            swal("Receipt Successfully Cancelled ");
            $location.path("dailycashregister");
        });
        $medwiseLog.save('CancelRec', "Receipt Canceled");
    }

});
