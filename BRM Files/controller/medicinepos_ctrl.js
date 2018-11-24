angular.module('medwise').controller('medicinepos_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.pos = {};
    $scope.pos.items_list = [];
    $scope.pos.net_amount = 0;
    $scope.pos.total_amount = 0;
    $scope.pos.medicinepo_authorised_by = $scope.login_data.edwise['uid'];
    $scope.show_Net_Price = 0;
	$scope.pos.discount = 0;
    $scope.pos.items_list.mpo_free = 0;
    $scope.total = 0;
	$scope.PrintShow = 0;

    $scope.addBtnDisable = 'yes';

    $scope.redirectHome = function(){
        $location.path('dashboard');
    }

    $scope.init = function ()
    {
        $scope.action = 1;
        $http.get("../php/medicines_pos.php?action=all").then(function OnSuccess(res) {
            $scope.med_pos = res.data;
            if(Array.isArray($scope.med_pos)){
                $scope.NoData = 0;
                for (i in $scope.med_pos){
                        $scope.med_pos[i].medicinepo_id = Number($scope.med_pos[i].medicinepo_id);
                    }
            }else{
                $scope.med_pos = [];
                $scope.NoData = 1;
            }
        });
        $medwiseLog.save('Medicine PO', "Medicine PO opened");
    }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }


    $scope.add_new_po = function ()
    {
        $scope.action = 2;
        if($scope.pos.items_list.length == 0)
            {
                $scope.add_item();
            }
        $scope.medpo_datee = new Date();
        $scope.pos.medicinepo_date = $scope.medpo_datee.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
        $http.get("../php/medicines_pos.php?action=supplier").then(function OnSuccess(res) {
            $scope.suppliers = res.data;
        });

        // $http.get("../php/medicines.php?action=all").then(function OnSuccess(res) {
        //     $scope.medunits_data = res.data;
        //     //console.table($scope.medunits_data);
        // });
        $medwiseLog.save('Clicked on Add New MedicinetPO', "");
    }


    $scope.autosearch_data = function (temp) {
        $http.get("../php/direct_purchase_order.php?action=medicine_search&search_string=" + temp).then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
            if (!Array.isArray($scope.medunits_data)) {
                $scope.medunits_data = [];
            }
        });
    }


    $scope.show_items = function (idx) {
		//alert(idx);
        $http.get("../php/medicines_pos.php?action=medicine_pod&medicine_po_id="+idx).then(function OnSuccess(res) {
            $scope.med_pos_data = res.data;
            //console.log($scope.med_pos_data);
            if(Array.isArray($scope.med_pos_data)){
                $scope.net_amount = $scope.medicinepo_net_price;
            }else{
                $scope.med_pos_data = [];
            }
        });
        $medwiseLog.save('Retrieved the Items of PO', idx);
    }

    $scope.print_details = function (idx) {
        //alert(idx);
        $http.get("../php/medicines_pos.php?action=medicine_pod_for_print&medicine_po_id="+idx).then(function OnSuccess(res) {
            $scope.med_pos_print_data = res.data;
            //console.log($scope.med_pos_print_data );
            $scope.total = 0;
            if(Array.isArray($scope.med_pos_print_data.mpo_details)){
                for(var i in $scope.med_pos_print_data.mpo_details){
                    var price = (Number($scope.med_pos_print_data.mpo_details[i].mpo_pp) * Number($scope.med_pos_print_data.mpo_details[i].mpo_qty));
                    var net_price = (price * Number($scope.med_pos_print_data.mpo_details[i].tax_percent) / 100);
                    $scope.total += price + net_price;
                }
            }
            //alert($scope.total);
        });
        $medwiseLog.save('Retrieved the Items of PO', idx);
    }

    $scope.add_item = function ()
    {
        var items = {
            //     mrp: '',
            //     qty: '',
            //     amount: '',
            //     finamount:''

        }
		$scope.pos.discount = 0;
        $scope.pos.items_list.push(items);
        for(var t in $scope.pos.items_list)
            {
                if($scope.pos.items_list[t].mpo_qty !== undefined)
                    {
                        $scope.addBtnDisable = 'no';
                    }
                else{
                        $scope.addBtnDisable = 'yes';
                        break;
                    }
            }
        $medwiseLog.save('Items added To Object', "");

    }

    $scope.save_medicine_po_data = function () {
        //alert("ok");
        // var d = new Date($scope.pos.assetpo_date);
        // var dob = d.getFullYear() + '/' + (parseInt(d.getMonth()) + 1) + '/' + d.getDate();


        var data = $.param({
            medicine_pos: $scope.pos
        });

        var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        //console.log($scope.pos);
        $http.post("../php/medicines_pos.php?action=add", data, config).then(function OnSuccess(res, status, header, config) {
            console.log(res.data);
            $scope.action = 1;
            $route.reload();
        });
        $medwiseLog.save('Medicine PO', log_data);
    }



    $scope.previous_item_data =function(obj, index)
    {
        //alert(item_id);
        //console.log(obj);
        $scope.pos.items_list[index].mpo_item_id = obj.med_id;
        $http.get("../php/medicines_pos.php?action=item_latest_po&item_id=" + obj.med_id).then(function OnSuccess(res){
            $scope.previous_data = res.data;
            //console.log($scope.previous_data);

            if (Array.isArray($scope.previous_data))
            {
                $scope.pos.items_list[index].mpo_mrp = $scope.previous_data[0].mpo_mrp;
                $scope.pos.items_list[index].mpo_pp = $scope.previous_data[0].mpo_pp;
                $scope.pos.items_list[index].mpo_qty = $scope.previous_data[0].mpo_qty;
                $scope.pos.items_list[index].mpo_tax_id = $scope.previous_data[0].tax_id;
                $scope.pos.items_list[index].mpo_tax_name = $scope.previous_data[0].tax_name;
                $scope.pos.items_list[index].mpo_tax_percent = $scope.previous_data[0].tax_percent;
                $scope.change_qty(index);
            } else
            {
                $scope.pos.items_list[index].mpo_mrp = "";
                $scope.pos.items_list[index].mpo_pp = "";
                $scope.pos.items_list[index].mpo_qty = "";
                $scope.pos.items_list[index].mpo_tax_id = obj.med_tax;
                $scope.pos.items_list[index].mpo_tax_name = obj.tax_name;
                $scope.pos.items_list[index].mpo_tax_percent = obj.tax_percent;
                // $scope.pos.items_list[index].tax = "";
                // $scope.pos.items_list[index].amount = "";
                // $scope.pos.items_list[index].amount_tax = "";
                $scope.change_qty(index);
            }
        });
        $medwiseLog.save('Retrieved Previous Item Po Data', obj.med_id);
    }


    $scope.change_qty = function (idx)
    {
       // if($scope.move==1){
           // $scope.move=1;   
        // }else{
        //     $scope.move=1;
        // }
        //console.log(idx);
		$scope.pos.discount = 0;
        $scope.pos.items_list[idx].amount = $scope.pos.items_list[idx].mpo_pp * $scope.pos.items_list[idx].mpo_qty;
        $scope.pos.items_list[idx].amount_tax = $scope.pos.items_list[idx].amount + ($scope.pos.items_list[idx].amount * ($scope.pos.items_list[idx].mpo_tax_percent / 100));

        $scope.pos.net_amount = 0;

        $scope.pos.total_amount = 0;



        for (var i = 0; i < $scope.pos.items_list.length; i++)
            {
                $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
                $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
            }

        if($scope.pos.items_list[idx].mpo_qty != undefined)
            { $scope.show_Net_Price = 1; }
        else
            { $scope.show_Net_Price = 0; }

            $scope.addBtnDisable = 'no';

			for(var i = 0; i < $scope.pos.items_list.length; i++){

				if($scope.pos.items_list[i].mpo_qty !== undefined){
					if($scope.addBtnDisable !== 'yes'){
						$scope.addBtnDisable = 'no';
					}
				}else{
					$scope.addBtnDisable = 'yes';
				}
			}
        $medwiseLog.save('Changed Quantity of item', idx);
    }

    $scope.change_pp = function(idx)
        {
			$scope.pos.discount = 0;
            $scope.pos.items_list[idx].amount = $scope.pos.items_list[idx].mpo_pp * $scope.pos.items_list[idx].mpo_qty;
            $scope.pos.items_list[idx].amount_tax = $scope.pos.items_list[idx].amount + ($scope.pos.items_list[idx].amount * ($scope.pos.items_list[idx].tax / 100));
            $scope.pos.net_amount = 0;
            $scope.pos.total_amount = 0;
            for (var i = 0; i < $scope.pos.items_list.length; i++) {
                $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;

                $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
            }
            $medwiseLog.save('Changed Purchase Price of item', idx);
        }


    $scope.item_remove = function (idx, amount)
        {
			$scope.pos.discount = 0;
            $scope.pos.net_amount = $scope.pos.net_amount - amount;
            $scope.pos.items_list.splice(idx, 1);
            $scope.addBtnDisable = 'no';

            $scope.pos.net_amount = 0;
            $scope.pos.total_amount = 0;
            for (var i = 0; i < $scope.pos.items_list.length; i++) {
                $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
                $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;

            }
            $medwiseLog.save('Removed Previous Item Data', idx);
        }


	$scope.get_discount = function()
	{
		if($scope.pos.discount != '' && $scope.pos.discount != null)
            {
            $scope.pos.net_amount = $scope.pos.net_amount - ($scope.pos.net_amount * $scope.pos.discount) / 100;
            }
		else
            {
                $scope.pos.net_amount = 0;
                for (var k = 0; k < $scope.pos.items_list.length; k++) {
                    $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[k].amount_tax;
                }
            }
    }


    $scope.print_po_details = function(opp)
        {
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


});
