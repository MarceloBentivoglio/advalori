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



  $('#install-details').click(function() {
    var trId = $(this).parent().parent().attr('id')
    $('.tr-install').each(function (i, el) {
      if ( $(el).attr('id') == trId ) {
        $(el).toggleClass('tr-hide')

      }
    })
    })

 function deleteRow(btn) {
  var row = btn.parentNode.parentNode;
  row.parentNode.removeChild(row);
}

  })
