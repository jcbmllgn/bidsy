###
GLOBAL FUNCTIONS
###

# toggles a banner on the given id.
this.toggleBanner = ( id ) ->
  if $("##{id} .banner").length
    banner = $("##{id} .banner")
    banner.toggle()
  else
    banner = $("##{id}").prepend("<div class='banner'>thing</div>")


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