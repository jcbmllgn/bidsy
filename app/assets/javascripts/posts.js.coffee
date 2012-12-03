# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

  # Make input fields editable
  $('.post-field.input').editable true

  ###
  COST TYPE SELECTOR
  ###

  $("#cost .type-selector p").click ->
    type  = $(this).attr 'class'
    other = if type == "auction" then "fixed" else "auction"

    $(this).css("color", "#646464")
           .siblings(".#{other}")
           .css("color", "#c2c2c2")
    $("#cost .type-placehoder, .types .#{other}").fadeOut 100
    $("#cost .types .#{type}").fadeIn 100

    # make sure the widget is tall enough
    $("#cost").css("height", "170px")
