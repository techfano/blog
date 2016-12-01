(function() {
  'use strict';
  angular.module('module.controller.post', [])
    .controller('controller.post', controllerPost); 

    controllerPost.$inject=[
    	'$scope',
    	'$resourceService',
      '$state',
      'loginService',
      'serviceStorage'
    ];

    function controllerPost($scope,$resourceService,$state) {

      var postAll =  $resourceService.request('postAll');
      var paragraphUrl =  $resourceService.request('paragraphUrl');

      postAll.get(function(data){
        $scope.publications = data;
      });

      $scope.$on('getArticle', function(event, data){
        $scope.articles = data;
        console.log(data);
      });
      

      $scope.trustHtml = function(data){
        return $sce.trustAsHtml(data);
      };
      
    }
    
})();