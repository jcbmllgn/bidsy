###
GLOBAL FUNCTIONS
###

# modal
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


# displayInputImage : <input_element Element> <img jQueryElement>
# Sets the given img src to the first file of the given input.
this.displayInputImage = ( input_element, img ) ->
  if input_element.files && input_element.files[0]
    reader = new FileReader()

    # hook action when file gets read.
    reader.onload = (e) ->
      img.attr 'src', e.target.result

    # read file
    reader.readAsDataURL(input_element.files[0])


# window.hookImageSelection : <input jQueryElemet> <img jQueryElement>
# Calls displayInputImage on every change of the given input.
this.hookImageSelection = ( input, img ) ->
  input.on "change", (e) ->
    displayInputImage(e.target, img);