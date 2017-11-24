//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require Chart.bundle
//= require chartkick

//= require cocoon

//= require_tree .


$(document).ready(function() {
  $('#drop').click(function() {
    $('.dropdown-spec').toggleClass('hidden')
  })
})
