require.config({

  baseUrl: "js/scripts",

  paths: {
    'angular': '../angular/angular.min',
    'angular-route': '../angular/angular-route.min',
    'angular-resource': '../angular/angular-resource.min',
    'angular-sanitize': '../angular/angular-sanitize.min',
    'angularAMD': '../angular/angularAMD',
    'directives': 'directives',
    'factories': 'factories',
    'facebook' : '../angular/angular-facebook' 
  },

  shim: {
    'angularAMD': ['angular'],
    'angular-route': ['angular'],
    'angular-resource': ['angular'],
    'angular-sanitize': ['angular'],
    'facebook': ['angular']
  },

  deps: ['app',
         'constants/resourceServiceConfig',
         'services/resourceService',
         'directives/fb-components',
         'factories/fbUiFactory',
         'modules/ng-polymer'
        ]
});