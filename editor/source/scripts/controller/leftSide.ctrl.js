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

      $scope.close = function () {
        $mdSidenav('left').close()
          .then(function () {
            $log.debug("close LEFT is done");
          });
      };

      var postAll =  $resourceService.request('postAll');

      postAll.get(function(data){
        $scope.publications = data;
      });
    	
    }
    
})();