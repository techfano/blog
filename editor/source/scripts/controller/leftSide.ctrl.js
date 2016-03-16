(function() {
  'use strict';
  angular.module('module.controller.leftSide', [])
    .controller('controller.leftSide', controllerLeftSide); 

    controllerLeftSide.$inject=[
    	'$scope',
    	'$mdSidenav',
      '$mdUtil',
      '$log',
      '$resourceService'
    ];

    function controllerLeftSide($scope,$mdSidenav,$mdUtil,$log,$resourceService) {

      var postAll =  $resourceService.request('postAll');
      var paragraphUrl =  $resourceService.request('paragraphUrl');

      $scope.close = function () {
        $mdSidenav('left').close()
          .then(function () {
            $log.debug("close LEFT is done");
          });
      };

      postAll.get(function(data){
        $scope.publications = data;
      });

      $scope.getArticle = function(url){

        paragraphUrl.get({url:url},function(data){
          $scope.$broadcast('getArticle', data);
        });

      };
    	
    }
    
})();