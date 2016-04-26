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
//= require bootstrap
//= require jquery.turbolinks
//= require_tree .


$('.alert').delay(3000).slideUp(300)

$('.lead').typeIt({
  strings: [
    'Got any service or product to improve?',
    'Want to get response from the users easily.',
    'Use Aidia.',
    'It\'s simple and free to use.'
  ],
  lifeLike: true,
  breakLines: false,
  cursor: true,
});


jQuery(".headline").fitText(1.6);

$('article').readmore({
  speed: 100,
  collapsedHeight: 220
});
