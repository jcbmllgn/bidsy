# $(...).checkboxesValue()
# Get the given checkboxes value
jQuery.fn.checkboxesValue = ->
  $(this).children('.checked').html()

jQuery ($) ->
  # Select boxes
  $('.checkboxes li').addClass('unchecked')
  $('.checkboxes li.unchecked').click ->
    $(this).removeClass('unchecked').addClass('checked')
           .siblings().removeClass('checked').addClass('unchecked')
