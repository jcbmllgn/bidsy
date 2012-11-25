###
GLOBAL FUNCTIONS
###

# $(...).selectText()
# Select all of the text in `this` element.
jQuery.fn.selectText = ->
  doc = document
  element = this[0]
  if doc.body.createTextRange
    range = document.body.createTextRange()
    range.moveToElementText(element)
    range.select()
  else if window.getSelection
    selection = window.getSelection()
    range = document.createRange()
    range.selectNodeContents(element)
    selection.removeAllRanges()
    selection.addRange(range)


# toggle_modal
# Toggles the page's modal. Never have a page with more then 1 modal,
# this function will toggle all of them.
this.toggle_modal = ->
  if $('.modal').is(":visible")
    $('.modal').fadeOut()
    $('.blackout').fadeOut ->
      $('.blackout').remove()
  else
    $('body').append("<div class='blackout'></div>")
    $('.blackout, .modal').fadeIn()

  # If user clicks on blackdrop or 'x' button the modal closes.
  $('.blackout').on 'click', ->
    toggle_modal()


# display_input_image : <input_element Element> <img jQueryElement>
# Sets the given img src to the first file of the given input.
this.display_input_image = ( input_element, img ) ->
  if input_element.files && input_element.files[0]
    reader = new FileReader()

    # hook action when file gets read.
    reader.onload = (e) ->
      img.attr 'src', e.target.result

    # read file
    reader.readAsDataURL(input_element.files[0])


# window.hook_image_selection : <input jQueryElemet> <img jQueryElement>
# Calls display_input_image on every change of the given input.
this.hook_image_selection = ( input, img ) ->
  input.on "change", (e) ->
    display_input_image(e.target, img)