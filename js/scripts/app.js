define(['angularAMD', 'angular-route','angular-resource','facebook'], function (angularAMD) {
  
  var app = angular.module("webapp", ['ngRoute','ngResource','ngFacebook']);

  app.config(function ($routeProvider,$facebookProvider) {
  
    $facebookProvider.setAppId('280600418655651');

    $facebookProvider.setPermissions("publish_actions");

    $routeProvider
    .when("/home", angularAMD.route({
        templateUrl: 'views/home.html',
        controller: 'HomeCtrl',
        controllerUrl: 'controller/home'
    }))
  
    .when("/portada", angularAMD.route({
        templateUrl: 'views/home.html',
        controller: 'HomeCtrl',
        controllerUrl: 'controller/home'
    }))
    .when("/article/:url/", angularAMD.route({
        templateUrl: 'views/article.html',
        controller: 'articleCtrl',
        controllerUrl: 'controller/article'
    }))
    .when("/articulo/:url/", angularAMD.route({
        templateUrl: 'views/article.html',
        controller: 'articleCtrl',
        controllerUrl: 'controller/article'
    }))
    
    .otherwise({redirectTo: "/portada"});
    
  });

  app.run( function( $rootScope ) {
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

  angularAMD.bootstrap(app,'directives/sticky');

  return app;
});