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

var soundcloudKey = 'f43e5fe0023f09c558e18747e7c4c708';

angular.module('soundcloudApp', []).controller('aCtrl', ['$scope', '$http',
    function($scope, $http) {
        // $scope.user = {};
        // $scope.getUser = function() {
        //     var url = 'https://api.soundcloud.com/users/zedd.json?client_id=';
        //     var endpoint = url + soundcloudKey;
        //     return $http({
        //         method: 'GET',
        //         url: endpoint
        //     });
        // };

        // $scope.getUser().then(function(members) {
        //     $scope.team = members.data;
        //     $scope.status = members.status;
        // });

    }
]);