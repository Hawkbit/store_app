// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function(){
    //dropdown behavior
    $('ul.navb li.dropdown').hover(function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(100).show();
  }, function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(100).hide();
});
    
//login
$('#login').click(function(e){
    e.preventDefault();
    $('#login-content').slideToggle();
    if ($('#login-content').is(":visible")){
    $('#login-content').find('#user_email').focus();
    }
});
    

    
};
$(document).ready(ready);
$(document).on('page:load', ready);