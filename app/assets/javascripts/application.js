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
//= require jquery_ujs
//= require turbolinks
//= require tinymce-jquery
//= require unobtrusive_flash
//= require unobtrusive_flash_ui
//= require jquery.bettertabs.min
//= require_tree .

UnobtrusiveFlash.flashOptions['timeout'] = 4000; // milliseconds
jQuery('.bettertabs').bettertabs(); // apply bettertabs to any element with the bettertabs css class
