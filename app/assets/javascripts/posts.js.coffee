# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

  ###
  SHIPPING WIDGET
  ###
  $('.shipping-info').hover ->
    $('.shipping-tooltip').fadeIn();
  , ->
    $('.shipping-tooltip').fadeOut();

  ###
  IMAGE
  ###

  # set image when user selects an image from the input drop-down.
  hook_image_selection $("#HIDDENImageName"), $("#productImage")

  ###
  HIDDEN FORM
  ###

  # assigning Title
  $('#titleEdits').focusout (e) ->
    $('#HIDDENTitle').html $(this).text()

  # assigning Description
  $('#descriptionEdits').focusout (e) ->
    $('#HIDDENDescription').html $(this).text()

  # assigning Description
  $('#startAmount').focusout (e) ->
    $('#HIDDENStartingPrice').html $(this).val()

  # assigning HIDDENImageName
  # kinda a hack, not sure if there is a better way todo this.
  $('#productImage').on 'click', (e) ->
    $('#HIDDENImageName').click()
    setInterval ->
      $('#HIDDENImageName').html $('#HIDDENImageName').val()
    , 1
    return false

  # submission of hidden form
  $("#publishBtn").on 'click', (e) ->
    $("#HIDDENForm").submit()

  # # append to fields.
  # $('#rowCreator select').on('change', function(){
  #   var keyName = $(this).val();
  #   $('#rowCreator').before('<div class="fieldRow"><p class="key">'+ keyName.toLowerCase() +' <span>- Delete</span></p><p class="value" contenteditable="true">Edit me</p></div>');
  #   var added = $('.fieldRow').last();

  #   # add to hidden form
  #   $('#HIDDENForm').append("<textarea name='fields["+ keyName.toLowerCase() +"]'>Edit me</textarea>");

  #   added.find('.value').focusout(function (e) {
  #     var val = $(this).html();
  #     $('#HIDDENForm textarea[name="fields['+ keyName.toLowerCase() +']"]').html(val);
  #   });

  #   $('#productDetials .productStats .fieldRow .key span').click(function(){
  #     $(this).parent().parent().remove();
  #     $('#HIDDENForm textarea[name="fields['+ keyName.toLowerCase() +']"]').remove();
  #   });
  # });

  # # assigning HIDDEN from fields
  # $('.fieldRow .value').focusout(function (e) {
  #   var input = $(e.target);
  #   var keyName = input.parent().find('.key').html();
  #   var val = input.html();
  #   $('#HIDDENForm textarea[name="fields['+ keyName.toLowerCase() +']"]').html(val);
  # });