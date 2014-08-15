// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
   $('#intro-header').mousemove(function(e){
      var mousePosX = (e.pageX/$(window).width())*2.5;
      $('#intro-header').css('background-position-x', mousePosX +'%');
      var mousePosY = (e.pageY/$(window).height())*2.5;
      $('#intro-header').css('background-position-y', mousePosY +'%');
   }); 
});