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
    
//show login form
$('#login').click(function(e){
    e.preventDefault();
    $('#login-content').slideToggle();
    if ($('#login-content').is(":visible")){
    $('#login-content').find('#user_email').focus();
    }
});


//make login request
$('.actions input').click(function(e){
  e.preventDefault();
  alert('butt');
  $.ajax({
       url:'/users/sign_in.json',
       type:'POST',
       dataType:'json',
       data: {"user":{"email": "therealdpyles@gmail.com", "password": "Bastard4!", commit:'Log in', remember_me:1}},
      fail: function(msg){
          console.log(msg);
      }
        
         })
});
    
//make logout request
  

};

     
     
     
$(document).ready(ready);
$(document).on('page:load', ready);