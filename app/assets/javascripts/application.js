// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require 'bootstrap'
//= require_tree .


// We need to persist the results of the SC.get('/me') in the db
// The redirect should point to where we want to funnel the data
// 1. Create a rails controller 
// 2. Create a method that persists will persist the data
// 3. Create a route that points to that method and will act as our API to capture the incoming JSON
// 4. Issue a GET ($http) request to send 



angular.module('soundcloudApp', []).controller('appCtrl', ['$scope', '$http',
    function($scope, $http) {
        
    }
]);


// EXAMPLE
// angular.module('angulartest', []).controller('aCtrl', ['$scope', '$http', function($scope, $http) {
//   console.log('Angular loaded');

//   $scope.is_anagram = function() {
//     var data = $http.get('http://localhost:3000/api/' + $scope.teststring).success(function(data, status, headers, config) { $scope.data = data; });
//   }

// }]);