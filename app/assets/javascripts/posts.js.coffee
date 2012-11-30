# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

  ###
  SHIPPING WIDGET
  ###

  # Local pick up only
  $('.shipping-info .checkboxes li.local-pickup').click ->
    $('.options .zip').slideDown()
    $('.options .shipping-option').slideUp()
  # Shipping only
  $('.shipping-info .checkboxes li.mail-delivery').click ->
    $('.options .zip').slideUp()
    $('.options .shipping-option').slideDown()
  # Shipping and local pickup
  $('.shipping-info .checkboxes li.both-options').click ->
    $('.options .zip').slideDown()
    $('.options .shipping-option').slideDown()

  ###
  Sell item type: either fixed price or auction. The variable 'type' is equal to the chosen type.
  ###

  $('div.bid-type-selector p').click -> # grabbing click on either option
    type = $(this).attr 'class' # type equals either fixed or auction, based on the button they clicked on
    if type == "auction"
      other = "fixed"
    else
      other = "auction"

    $(this)
      .css('color','#646464')
      .siblings('.' + other).css('color', '#c2c2c2')
    $('.bid-type-placehoder, .bid-types .type-' + other).fadeOut(100) #fading out the default arrow background and the other option
    $('.bid-types .type-' + type).fadeIn(100) #fading in the selected option
    $('.bid-widget').css('height', '170px') #making sure the widget is tall enough


  # Hover tooltip
  $('.shipping-info').hover ->
    $('.shipping-tooltip').fadeIn();
  , ->
    $('.shipping-tooltip').fadeOut();


  # All Text Inputs of this page
  input_fields = $('.post-field.input')
  # Make input fields editable
  input_fields.editable true

  ###
  FOR TESTING
  ###
  $('#toggle-editable').click -> input_fields.toggleEditable()
