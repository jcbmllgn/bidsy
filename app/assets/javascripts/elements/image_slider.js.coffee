
$('.image-picker .item-thumbnail').click ->
  if $(this).hasClass 'current-main-image' != true
    newSrc = $(this).children().attr 'src'
    $(this)
      .addClass('current-main-image')
      .siblings('.item-thumbnail').removeClass('current-main-image')
    $('.main-image img').attr('src', newSrc)

    console.log 'Not current-main-image'