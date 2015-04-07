define(['angularAMD', 'angular-route','angular-resource','facebook'], function (angularAMD) {
  
  var app = angular.module("webapp", ['ngRoute','ngResource','ngFacebook']);

  app.config(function ($routeProvider,$facebookProvider,$httpProvider) {
  
    $facebookProvider.setAppId('280600418655651');

    $facebookProvider.setPermissions("publish_actions");

    $routeProvider
    .when("/dashboard", angularAMD.route({
        templateUrl: 'views/dashboard.html',
        controller: 'DashboardCtrl',
        controllerUrl: 'controller/dashboard'
    }))
  
    .when("/login", angularAMD.route({
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl',
        controllerUrl: 'controller/login'
    }))
    
    .otherwise({redirectTo: "/login"});

    $httpProvider.interceptors.push(['$q', '$location', function($q, $location) {
        return {
                'request': function (config) {
                    config.headers = config.headers || {};
                    if (localStorage.getItem("token")) {
                        config.headers.Authorization = localStorage.getItem("token");
                    }
                    return config;
                },
                'responseError': function(response) {
                    if(response.status === 401 || response.status === 403) {
                        $location.path('/login');
                    }
                    return $q.reject(response);
                }
            };
        }]);
    
    });

    app.run( function( $rootScope ,$resource, $location) {
    

        var checkingSession = function(){

            var token=localStorage.getItem('token');

            var verify = $resource('http://localhost:4000/api/auth/verify/'+token);

            if(token){

              verify.get(function(verify){
                  $location.path('/dashboard');
              },function(error){
                  $location.path('/login');
              });              

            }else{
              $location.path('/login');
            }

        };
        
        $rootScope.$on('$routeChangeStart',function(obj,data){
            
            checkingSession();

        });

      // Load the facebook SDK asynchronously
        (function(){
         // If we've already installed the SDK, we're done
         if (document.getElementById('facebook-jssdk')) {return;}

         // Get the first script element, which we'll use to find the parent node
         var firstScriptElement = document.getElementsByTagName('script')[0];

         // Create a new script element and set its id
         var facebookJS = document.createElement('script'); 
         facebookJS.id = 'facebook-jssdk';

         // Set the new script's source to the source of the Facebook JS SDK
         facebookJS.src = '//connect.facebook.net/en_US/all.js';

         // Insert the Facebook JS SDK into the DOM
         firstScriptElement.parentNode.insertBefore(facebookJS, firstScriptElement);
        }());

    })

  angularAMD.bootstrap(app);

  return app;
});