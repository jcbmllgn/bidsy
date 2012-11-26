# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

  # All Text Inputs of this page
  input_fields = $('.post-field.input')

  # Make input fields editable
  input_fields.editable true

  ###
  FOR TESTING
  ###
  $('#toggle-editable').click -> input_fields.toggleEditable()