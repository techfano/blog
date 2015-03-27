define(['app'], function (app) {
    app.register.controller('LoginCtrl',['$scope','$resource', function (scope,$resource) {
   					
            var auth = $resource('http://localhost:4000/api/auth/Estefano/Estef4n0');
            auth.get(function(data) {
              
               localStorage.setItem("token", data.token);

            });

    }]);

});
