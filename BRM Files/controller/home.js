var app = angular.module('medwise', ['ngRoute', 'oc.lazyLoad', 'chieffancypants.loadingBar', 'ngAnimate', 'google.places', 'ngSanitize', 'ngCsv', 'ui.bootstrap', 'ui.select']);
var $routeProviderReference;
app.config(function ($routeProvider) {
    $routeProvider.otherwise({
        redirectTo: '/dashboard'
    })
    $routeProviderReference = $routeProvider;
});
app.filter('unique', function () {
    return function (collection, keyname) {
        var output = [];
        angular.forEach(collection, function (item) {
            if (output.indexOf(item[keyname]) === -1)
                output.push(item[keyname]);
        });
        return output;
    };
});

app.directive('fileModel', ['$parse', function ($parse) {
    return {
    restrict: 'A',
    link: function(scope, element, attrs) {
        var model = $parse(attrs.fileModel);
        var modelSetter = model.assign;

        element.bind('change', function(){
            scope.$apply(function(){
                modelSetter(scope, element[0].files[0]);
            });
        });
    }
   };
}]);

app.directive('fileUploadOfAnyFile', ['$parse', function ($parse) {
    return {
    restrict: 'A',
    link: function($scope, element, attrs) {
        var model = $parse(attrs.fileUploadOfAnyFile);
        var modelSetter = model.assign;

        element.bind('change', function(){
            $scope.$apply(function(){
                modelSetter($scope, element[0].files[0]);
            });
        });
    }
   };
}]);

app.factory('Excel', function ($window) {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
        base64 = function (s) {
            return $window.btoa(unescape(encodeURIComponent(s)));
        },
        format = function (s, c) {
            return s.replace(/{(\w+)}/g, function (m, p) {
                return c[p];
            })
        };
    return {
        tableToExcel: function (tableId, worksheetName) {
            var table = $(tableId),
                ctx = {
                    worksheet: worksheetName,
                    table: table.html()
                },
                href = uri + base64(format(template, ctx));
            return href;
        }
    };
});
app.factory('$medwiseLog', function ($window, $filter, $http) {
    return {

        save: function (title, extras) {
            //alert("log");
            var login = JSON.parse($window.sessionStorage.getItem('_login'));
            var obj = {
                uid: login.edwise.uid,
                date_time: $filter('date')(new Date(), 'yyyy-MM-dd HH:mm:ss'),
                client_ip: login.client_ip,

            };
            var data = $.param({
                action: 'log_data',
                login: obj,
                window: title,
                extra: extras
            });
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/login.php", data, config).then(function OnSuccess(res, header, config) {
                console.log('Log updated!');
            });
            return false;
        }


    };
});
app.controller('home_ctrl', function ($scope, $window, $rootScope, $http, $route, $filter) {
    $scope.login = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.menu = JSON.parse($window.sessionStorage.getItem('_menu'));
    $scope.c = 1;
    $scope.o = 1;
    //console.log($scope.menu);

    if ($scope.menu == null)
        signout();
    //console.log($scope.login);
    var ctrl_array = [];
    for (var i = 0; i < $scope.menu.length; i++) {
        ctrl_array[i] = "../controller/" + $scope.menu[i].controller + ".js";
    }
    for (var i = 0; i < $scope.menu.length; i++) {
        $routeProviderReference.when($scope.menu[i].tag, {
            templateUrl: $scope.menu[i].url,
            controller: $scope.menu[i].controller,
            resolve: {
                deps: function ($ocLazyLoad) {
                    //console.log(ctrl_array);
                    return $ocLazyLoad.load({
                        files: ctrl_array
                    });
                }
            }
        });
    }
    $scope.top_menu_load = function () {
        // $http.get("../php/home.php?year=all").then(function OnSuccess(res){
        // $scope.years=res.data;
        //console.log(res.data);
        // var x=$filter("filter")($scope.years, {current_year:0 });
        // $scope.sel_year=x[0].yid;
        // $rootScope.yname=x[0].year_name;

        $window.sessionStorage.setItem('_year', 'Year Home.js'); //x[0].yid);
        //	});
        // $http.get("../php/home.php?user_branch="+$scope.login.edwise.uid).then(function OnSuccess(res){
        // $scope.branches=res.data;
        //console.log(res.data);
        // $scope.sel_branch=res.data[0].bid;
        $window.sessionStorage.setItem('_branch', 'Branch home.js'); //res.data[0].bid);
        //$rootScope.bname=res.data[0].bname;

        //});

    }
    $scope.select_year = function (id, yname) {
        $scope.sel_year = id;
        $rootScope.yname = yname;
        $window.sessionStorage.setItem('_year', id);
        $route.reload();
    }
    $scope.select_branch = function (id, bname) {
        $scope.sel_branch = id;
        $rootScope.bname = bname;
        $window.sessionStorage.setItem('_branch', id);
        $route.reload();
    }

    $scope.onmenuload = function (menu) {
        $scope._xyz = $rootScope.x;
        var parent = [];
        var pic = [];
        var i = 0;
        var temp = '',
            t = '';
        do {
            if (menu[i].mainmenu != temp) {
                parent.push(menu[i].mainmenu);
                pic.push(menu[i].mainmenu_icon);
                temp = menu[i].mainmenu;
                t = menu[i].mainmenu_icon;
            }
            i++;
        } while (i < menu.length);
        $scope.obj = [];
        for (var k = 0; k < parent.length; k++) {
            var master = [];
            for (var j = 0; j < menu.length; j++) {
                if (parent[k] == menu[j].mainmenu)
                    master.push({
                        submenu: menu[j].submenu,
                        href: menu[j].href,
                        submenu_icon: menu[j].submenu_icon,
                        side_menu: menu[j].side_menu
                    });
            }
            var mobj = {
                mainmenu: parent[k],
                submenu: master,
                main_icon: pic[k]

            };
            $scope.obj.push(mobj);

        }
        // console.log($scope.obj);
    }

    $scope.re = function () {
        $scope.current_password = '';
        $scope.new_password = '';
        $scope.msg = '';
    }


    $scope.check_password = function (cpwd) {
        $('#mark1').focus();
        
        //alert($scope.login_data.edwise.uid);

        var data = $.param({
            user_id : $scope.login.edwise.uid,
            password : cpwd
        });
        var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        $http.post("../php/login.php?action=check_old_password",data,config).then(function OnSuccess(data,status,header,config){
            //console.log(data.data);
            $scope.result_data = data.data;
            //console.log($scope.result_data);
            if (!Array.isArray($scope.result_data)) {

                $scope.msg = "Invalid Current Password";
                //$scope.current_password = '';
                //$scope.new_password = '';

            } else {
                $scope.msg = '';
                $scope.o = 2;
            }
        });
    }




    $scope.new_password_check = function (cpr) {
        if ($scope.new_password != cpr) {
            $scope.msg1 = "Passwords don't Match"
            $scope.c = 1;
        } else {
            $scope.msg1 = '';
            $scope.c = 2;
        }
    }

    $scope.change_password = function (npwd) {
        //  alert("ok");
  
          /* $http.get("../php/login.php?action=password_com&name1=" + $scope.login_data.edwise.uid + "&password1=" + cpwd).then(function OnSuccess(res){
              $scope.result_data = res.data;
              console.log($scope.result_data);
          }); */
          var data = $.param({
              user_id: $scope.login.edwise.uid,
              password: npwd
          });
          var log_data = data;
          var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
          $http.post("../php/login.php?action=change_password", data, config).then(function OnSuccess(data, status, header, config) {
              //console.log(data.data);
              $scope.msg2 = "Password Changed Successfully";
              $scope.c = 1;
              $scope.o = 1;
              $route.reload();
  
          });
      }

     $scope.emptyChangePassword = function(){
        $scope.msg = '';
         $scope.current_password = undefined;
         $scope.new_password = '';
        $scope.confirm_password = '';
     }

});
