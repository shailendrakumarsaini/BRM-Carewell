angular.module('medwise').controller('medicineinward_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$routeParams,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
	$scope.medicine_inward = {};
	$scope.medicine_inward.items_list = [];
	$scope.medicine_inward.medicine_inward_supplier_id = '';
	$scope.medicine_inward.medicine_inward_po_id = '';
	$scope.medicine_inward.medicine_inward_user_id = '1';
	$scope.medicine_inward.medicine_inward_invoiceamt = 0;
    $scope.flag_for_disable = [];
    $scope.medicine_ob = {};
    $scope.medicine_ob.ob_items_list = [];
    $scope.medicine_ob.medicine_ob_user_id = $scope.login_data.edwise['uid'];


    $scope.choose_medicine = function(obj, idx){
        $scope.medicine_ob.ob_items_list[idx].ob_item_id = obj.med_id;
        $scope.medicine_ob.ob_items_list[idx].ob_box_pack = obj.med_boxpack;
    }

    $scope.add_new_ob = function()
    {
        $scope.action=4;
        var items ={};
        $scope.medicine_ob.ob_items_list.push(items);
        $medwiseLog.save('Add New IB');
    }
   

    $scope.openMedOB = function() {
        $scope.received_date_for_os = new Date();
        $scope.medicine_ob.received_date = $scope.received_date_for_os.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
        $http.get("../php/store.php?action=super_store").then(function OnSuccess(res) {
            $scope.store = res.data;
            });
            // $http.get("../php/medicines.php?action=all").then(function OnSuccess(res) {
            //     $scope.medunits_data = res.data;
            // });
        $scope.action = 4;
        if($scope.medicine_ob.ob_items_list.length == 0){
            var items ={};
            $scope.medicine_ob.ob_items_list.push(items);
        }

        $medwiseLog.save('Push Item Into Array');
    }

    $scope.autosearch_data = function (temp) {
        $http.get("../php/direct_purchase_order.php?action=medicine_search&search_string=" + temp).then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
            //console.log($scope.medunits_data);
            if (!Array.isArray($scope.medunits_data)) {
                $scope.medunits_data = [];
            }
        });
    }

    $scope.item_remove = function (idx) {

        $scope.medicine_ob.ob_items_list.splice(idx, 1);

        $medwiseLog.save('Removed Item Data', idx);
    }


    $scope.saveOB = function(){
        var data=$.param({ medicine_ob :$scope.medicine_ob });
        var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        //console.log($scope.medicine_ob);
        $http.post("../php/medicine_inward_register.php?action=add_ob", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $scope.action = 1;
            $route.reload();
            // $scope.init();
            //location.reload();
            //console.log(data);
        });
    }

    $scope.insert_batch = function(idx,value)
        {
            $scope.medicine_inward.items_list[idx].batch_no = value ;
        }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }

        $scope.insert_expiry = function(idx,value){
            var newdate = new Date(value);
            //$scope.expiry_date = new Date(value);
            //$scope.medicine_inward.items_list[idx].expiry_date = $scope.expiry_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
            $scope.medicine_inward.items_list[idx].expiry_date = newdate.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
        }

	$scope.callme=function(ind, rec_value){
		//$scope.medicine_inward.items_list[ind]['item_rec_qty'] = $scope.mpo_qty_received;

		if (typeof rec_value === 'undefined' || rec_value === '') {

			return '';
        }
        //alert(ind + " " + rec_value);
        //alert(rec_value <= $scope.medicine_inward.items_list[ind].previous_pend_qty);
        if (rec_value <= $scope.medicine_inward.items_list[ind].previous_pend_qty) {
            $scope.medicine_inward.items_list[ind].present_rec_qty = rec_value;
            $scope.medicine_inward.items_list[ind].item_rec_qty = Number($scope.medicine_inward.items_list[ind].previous_rec_qty) + Number($scope.medicine_inward.items_list[ind].present_rec_qty);
            $scope.medicine_inward.items_list[ind].item_pend_qty = Number($scope.medicine_inward.items_list[ind].previous_pend_qty) - Number($scope.medicine_inward.items_list[ind].present_rec_qty);
            $scope.medicine_inward.items_list[ind].item_amount = Number($scope.medicine_inward.items_list[ind].present_rec_qty) * Number($scope.medicine_inward.items_list[ind].mpo_pp);
            $scope.medicine_inward.items_list[ind].item_net_amount = (Number($scope.medicine_inward.items_list[ind].item_amount) * (Number($scope.medicine_inward.items_list[ind].tax) / 100)) + Number($scope.medicine_inward.items_list[ind].item_amount);

            var total_amount = 0;
            for (ci in $scope.medicine_inward.items_list) {

                total_amount += Number($scope.medicine_inward.items_list[ci].item_net_amount);
            }
            $scope.medicine_inward.medicine_inward_invoiceamt = total_amount;
            return rec_value;
        } else {

           // alert("Cant be greater than pending quantity");
            return $scope.medicine_inward.items_list[ind].previous_pend_qty;
        }
        $medwiseLog.save('To Enter the Persent Receiving quantity', "");
	 }


	$scope.init=function(){
	$scope.action=1;
	$http.get("../php/medicine_inward_register.php?action=all").then(function OnSuccess(res){
            $scope.med_inward_data=res.data;
            if(Array.isArray($scope.med_inward_data)){
                $scope.NoData = 0;
            }else{
                $scope.med_inward_data = [];
                $scope.NoData = 1;
            }
			//console.log($scope.inward_data);
		 });
         $medwiseLog.save('medicine Inward', "medicine Inward is opened");
    }



   //new medicine_inward
    $scope.add_inv_unit=function()
    {
        $scope.action=2;
        $http.get("../php/store.php?action=super_store").then(function OnSuccess(res) {
        $scope.sup = res.data;
            });
        $medwiseLog.save('To Add New Inward', "")
    }

    $scope.show_items = function (idx)
    {
        $scope.invoice_date = new Date();
        $scope.medicine_inward.medicine_inward_invoicedate = $scope.invoice_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
        $scope.received_date = new Date();
        $scope.medicine_inward.medicine_inward_receiveddate = $scope.received_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
		$scope.medicine_inward.items_list = [];
        $http.get("../php/medicines_pos.php?action=get_med_pod_if_not_rec&medicine_po_id="+idx).then(function OnSuccess(res) {
			$scope.inward_item_data = res.data;
            //console.log(res.data);
            if(!Array.isArray($scope.inward_item_data)){
                $scope.no_rec=1;
                $scope.test=0;
            }
            else {
                $scope.no_rec=0;
                $scope.test=1;
			    var total_invoice_amount = 0;
                for (z in $scope.inward_item_data) {
                    //console.log(z);
                    if(z == 0) {
                        $scope.medicine_inward.medicine_inward_supplier_id = $scope.inward_item_data[z].medicinepo_supplier_id;
                        $scope.medicine_inward.medicine_inward_po_id = $scope.inward_item_data[z].medicinepo_id;
                        //total_invoice_amount = Number($scope.inward_item_data[z].medicinepo_net_price);
                    }

                    var items = {
                        mpo_id: $scope.inward_item_data[z].mpo_id,
                        item_id: $scope.inward_item_data[z].mpo_item_id,
                        mpo_item_name: $scope.inward_item_data[z].mpo_item_name,
                        mpo_boxpack: $scope.inward_item_data[z].med_boxpack,
                        item_qty: $scope.inward_item_data[z].mpo_qty,
                        item_rec_qty: $scope.inward_item_data[z].mpo_qty_received,
                        item_pend_qty: $scope.inward_item_data[z].mpo_qty - $scope.inward_item_data[z].mpo_qty_received,
                        item_amount: 0,
                        item_net_amount: 0,
                        mpo_pp: $scope.inward_item_data[z].mpo_pp,
                        tax: $scope.inward_item_data[z].tax,
                        tax_percent: $scope.inward_item_data[z].tax_percent,
                        previous_rec_qty: $scope.inward_item_data[z].mpo_qty_received,
                        previous_pend_qty: $scope.inward_item_data[z].mpo_qty - $scope.inward_item_data[z].mpo_qty_received,
                        present_rec_qty: 0
                    }

                    $scope.medicine_inward.items_list.push(items);

                    // if (($scope.inward_item_data[z].mpo_qty - $scope.inward_item_data[z].mpo_qty_received) <= 0) {

                    //     $scope.flag_for_disable.push(0);
                    // } else {

                    //     $scope.flag_for_disable.push(1);
                    // }
			    }
			    $scope.medicine_inward.medicine_inward_invoiceamt = total_invoice_amount;
            }
        });
        $medwiseLog.save('To Show the Items', idx);
    }

	// $scope.date_rdv = $filter('date')(Date.now(), 'yyyy-MM-dd');


	$scope.save_itm_invward=function(){
		//alert("ok");
		var data = $.param({ medicine_inward: $scope.medicine_inward });
            var log_data = data;
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/medicine_inward_register.php?action=add",data,config).then(function OnSuccess(res,status,header,config){
			// $scope.result=res.data;
            //console.log(res.data);
            //$scope.action=1;
			$route.reload();
			//console.log(data);
        });
        $medwiseLog.save('medicine Inward', log_data);
    }


    $scope.show_inward = function (idx) {
		//alert(idx);
        $http.get("../php/medicine_inward_register.php?action=specific_inward&medicine_po_id="+idx).then(function OnSuccess(res) {
            $scope.med_inward_record = res.data;

            $scope.medicine_inward_show = [];
            for (z in $scope.med_inward_record) {
				//alert(z);
				if(z==0)
				{
                    var inward_show = {
					    inward_show_store_name: $scope.med_inward_record[z].store_name,
					    inward_show_po_id: $scope.med_inward_record[z].medicinepo_id
                    }
                }
            }

            $scope.medicine_inward_show.push(inward_show);
            //$scope.net_amount=medicinepo_net_price;
        });
        $medwiseLog.save('To Show the Inward Data',idx);
    }


    $scope.change_ob = function(obj1)
		{

			obj1.ob_opening_balance = (obj1.ob_item_pp * obj1.ob_item_qty);
		}



});
