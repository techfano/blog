define(['app'], function (app) {
    app.register.controller('DashboardCtrl',['$scope','$resource', function ($scope,$resource) {

         var token=localStorage.getItem('token');
            
            var verify = $resource('http://localhost:4000/api/verify/'+token);

            verify.get(function(verify){
                $location.path('/login');
            },function(error){
                $location.path('/dashboard');
            });
    	
    }]);

});
