$(document).ready ->
  $('.image-picker .item-thumbnail').click ->
    newSrc = $(this).children().attr 'src'
    $(this)
      .addClass('current-main-image')
      .siblings('.item-thumbnail').removeClass('current-main-image')
    $('.main-image img').attr('src', newSrc)