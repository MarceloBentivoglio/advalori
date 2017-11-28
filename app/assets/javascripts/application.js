//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require Chart.bundle
//= require chartkick
//= require jquery_ujs
//= require cocoon

//= require_tree .

$(document).ready(function() {
  $('#drop').click(function() {
    $('.dropdown-spec').toggleClass('hidden')
  })

  $('.install-details').click(function(e) {
    // e.preventDefault()
    var trId = $(this).parent().parent().attr('id')
    $('.tr-install').each(function (i, el) {
      if ( $(el).attr('id') == trId ) {
        $(el).toggleClass('tr-hide')

      }
    })
  })

  $('#cnpj').mask('00.000.000/0000-00');
  $('#phone').mask('(00) 0000-0000');
  $('#zip_code').mask('00000-000');
  $('#money').mask("#.##0,00", {reverse: true});
  $('#cpf').mask('000.000.000-00', {reverse: true});

})


