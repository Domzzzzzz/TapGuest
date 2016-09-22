// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap.min
//= require admin-lte
//= require_tree .
//-----------------------------------------------------------------------
// function - show slider button when 'Agree to terms' button is clicked
var showCheckbox = function(){
  $('#terms-checkbox').removeClass('hidden');
};

// function - send stripe params to subscriptions controller for free plan
var freePlan = function(){

};

//function - toggle the sidebar when hamburger button is clicked
$(function(){
  var isOpen = false;
  $('#hamburger').click(function(){
    if(isOpen == false){
      $('#sidebar').animate({
        width: '250px'
      }, 500);
      this.blur();
      isOpen = true;
    }
    else {
      $('#sidebar').animate({
        width: '0px'
      }, 250);
      this.blur();
      isOpen = false;
    }
    return isOpen;
  });
});

// function - show password fields when 'Change Password' link is clicked
$(function(){
  $('.show-fields').click(function(e){
    e.preventDefault();
    $('.hidden-fields').removeClass('hidden');
    $('.changePW').addClass('hidden');
  });
});

// Turbolinks loads pages asynchronously which interferes with jquery
// Requiring Turbolinks at the bottom of this page ensures
// jquery is loaded before Turbolinks is loaded
//= require turbolinks
