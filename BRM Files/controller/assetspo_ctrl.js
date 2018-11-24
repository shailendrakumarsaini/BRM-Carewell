angular.module('medwise').controller('assetspo_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.pos = {};
    $scope.pos.items_list = [];
    $scope.pos.net_amount = 0;
    $scope.pos.total_amount = 0;
    $scope.pos.assetpo_authorised_by = $scope.login_data.edwise['uid'];
    $scope.show_Net_Price = 0;
    $scope.addBtnDisable = 'yes';
    $scope.pos.assetpo_datee = '';


    $scope.redirectHome = function(){
        $location.path('dashboard');
    }

    $scope.init = function ()
    {

        $http.get("../php/assets_pos.php?action=all").then(function OnSuccess(res) {
            $scope.assets_pos = res.data;
            if(Array.isArray($scope.assets_pos)){
                $scope.NoData = 0;
                for (var ind in $scope.assets_pos){
                    $scope.assets_pos[ind].assetpo_id = Number($scope.assets_pos[ind].assetpo_id);
                }
            }else{
                $scope.assets_pos = [];
                $scope.NoData = 1;
            }
        });
        $scope.action = 1;
        $medwiseLog.save('Asset PO', "Asset PO opened");
    }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }


    $scope.add_new_po = function ()
    {
        $scope.action = 2;
        $scope.assetpo_datee = new Date();
        $scope.pos.assetpo_date = $scope.assetpo_datee.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });

        if($scope.pos.items_list.length == 0){
            $scope.add_item();
        }

        $http.get("../php/assets_pos.php?action=supplier").then(function OnSuccess(res) {
            $scope.suppliers = res.data;
        });

        $http.get("../php/assets.php?action=assets_list").then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
        });
        $medwiseLog.save('Clicked on Add New AssetPO', "");
    }

    $scope.show_items = function (id) {
        //alert(id);
        $http.get("../php/assets_pos.php?action=asset_pod&asset_po_id="+id).then(function OnSuccess(res) {
            $scope.assets_pos_data = res.data;
            //console.table($scope.assets_pos_data);
        });
        $medwiseLog.save('Retrieved the Items of PO', id);
    }

    $scope.add_item = function ()
    {
        var items = {
            //     mrp: '',
            //     qty: '',
            //     amount: '',
            //     finamount:''
        }
        $scope.pos.items_list.push(items);


        for(var t in $scope.pos.items_list)
            {
                if($scope.pos.items_list[t].apo_qty !== undefined)
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

    $scope.get_tax = function (x)
        {
        var tax = $filter('filter')($scope.medunits_data, { asset_id: x });
        return tax[0].tax_percent;
        //$medwiseLog.save('Retrieved the Tax of item', x);
        }


    $scope.save_asset_po_data = function () {
        // var d = new Date($scope.pos.assetpo_date);
        // var dob = d.getFullYear() + '/' + (parseInt(d.getMonth()) + 1) + '/' + d.getDate();
        // $scope.temp = new Date();
        // $scope.pos.assetpo_datee = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });

        var data = $.param({
            asset_pos: $scope.pos
        });
        var log_data = data;
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        //console.log($scope.pos);
        $http.post("../php/assets_pos.php?action=add", data, config).then(function OnSuccess(res, status, header, config) {
            //console.log(res.data);
            $route.reload();
            //location.reload();
            //console.log(data);
        });
        $medwiseLog.save('Asset PO', log_data);
    }



    $scope.previous_item_data =function(item_id, index)
    {
        //alert(item_id);
        $scope.pos.items_list[index].apo_item_id = item_id;
        $http.get("../php/assets_pos.php?action=item_latest_po&item_id=" + item_id).then(function OnSuccess(res){
            $scope.previous_data = res.data;
            //console.log($scope.previous_data);

            if (Array.isArray($scope.previous_data))
            {
                $scope.pos.items_list[index].apo_mrp = $scope.previous_data[0].apo_mrp;
                $scope.pos.items_list[index].apo_pp = $scope.previous_data[0].apo_pp;
                $scope.pos.items_list[index].apo_qty = $scope.previous_data[0].apo_qty;
                $scope.change_qty(index);
            } else
            {
                $scope.pos.items_list[index].apo_mrp = "";
                $scope.pos.items_list[index].apo_pp = "";
                $scope.pos.items_list[index].apo_qty = "";
                // $scope.pos.items_list[index].tax = "";
                // $scope.pos.items_list[index].amount = "";
                // $scope.pos.items_list[index].amount_tax = "";
                $scope.change_qty(index);
            }
        });
        $medwiseLog.save('Retrieved Previous Item Po Data', item_id);
    }


    $scope.change_qty = function (idx)
    {
       // if($scope.move==1){
           // $scope.move=1;
        // }else{
        //     $scope.move=1;
        // }
        //console.log(idx);

        $scope.pos.items_list[idx].amount = $scope.pos.items_list[idx].apo_pp * $scope.pos.items_list[idx].apo_qty;
        $scope.pos.items_list[idx].amount_tax = $scope.pos.items_list[idx].amount + ($scope.pos.items_list[idx].amount * ($scope.pos.items_list[idx].tax / 100));
        $scope.pos.net_amount = 0;
        $scope.pos.total_amount = 0;
        for (var i = 0; i < $scope.pos.items_list.length; i++)
        {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
        }

        if($scope.pos.items_list[idx].apo_qty != undefined)
        { $scope.show_Net_Price = 1; }
        else { $scope.show_Net_Price = 0; }

        $scope.addBtnDisable = 'no';
            for(var j in $scope.pos.items_list){
                if($scope.pos.items_list[j].apo_qty !== undefined){
                    if($scope.addBtnDisable !== 'yes')
                        {
                            $scope.addBtnDisable = 'no';
                        }
                }else{
                    $scope.addBtnDisable = 'yes';
                }
            }
        $medwiseLog.save('Changed Quantity of item', idx);
    }


    $scope.change_pp = function(idx){
        $scope.pos.items_list[idx].amount = $scope.pos.items_list[idx].apo_pp * $scope.pos.items_list[idx].apo_qty;
        $scope.pos.items_list[idx].amount_tax = $scope.pos.items_list[idx].amount + ($scope.pos.items_list[idx].amount * ($scope.pos.items_list[idx].tax / 100));
        $scope.pos.net_amount = 0;
        $scope.pos.total_amount = 0;
        for (var i = 0; i < $scope.pos.items_list.length; i++)
        {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
        }
        $medwiseLog.save('Changed Purchase Price of item', idx);
    }


    $scope.item_remove = function (idx, amount)
    {
        $scope.pos.net_amount = $scope.pos.net_amount - amount;
        $scope.pos.items_list.splice(idx, 1);
        $scope.addBtnDisable = 'no';

        $scope.pos.net_amount = 0;
        $scope.pos.total_amount = 0;
        for (var i = 0; i < $scope.pos.items_list.length; i++)
        {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;


        }
        $medwiseLog.save('Removed Previous Item Data', idx);
    }





});
