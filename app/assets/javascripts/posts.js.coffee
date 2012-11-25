# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

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

  # set image when user selects an image from the input drop-down.
  hookImageSelection $("#HIDDENImageName"), $("#productImage")

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



  # Script for the flashes begins here.
  # js so that when someone clicks on a contenteditable field it automatically selects all text.

  # jQuery.fn.selectText = () ->
  #   doc = document
  #   element = this[0]
  #   if (doc.body.createTextRange)
  #     range = document.body.createTextRange()
  #     range.moveToElementText(element)
  #     range.select()
  #   else if (window.getSelection)
  #     selection = window.getSelection()
  #     range = document.createRange()
  #     range.selectNodeContents(element)
  #     selection.removeAllRanges()
  #     selection.addRange(range)

  #   ($ document).ready ->
  #     if $('body').data('action') == 'new' # All this js is to be executed if on edit page
  #       console.log 'DUCK'
  #       $('.editable, .value').click =>
  #         $(this).selectText();
  #       # Sloppy js to make sure the flash height is correct
  #       numChildren = $('div.flash div p').length
  #       newHeight = ((numChildren * 9) + 20) + 'px'
  #       $('div.flash').css height: 'newHeight'

  #       $('.editable, .value').attr contenteditable: true

  #     if $('body').data 'action' == 'show'  # All this js is to be executed if on view/show page
  #       $('.editable').attr('contenteditable','false').removeClass('editable')

  jQuery ($) ->
    $('.shipping-info').hover ->
      $('.shipping-tooltip').fadeIn();
    , ->
      $('.shipping-tooltip').fadeOut();







