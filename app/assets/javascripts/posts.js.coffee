# NEW ACTION SCRIPT
$(document).bind 'new_posts.load', (e,obj) =>

  # All Post Fields
  post_fields = $('.post-field.input')

  # Make all fields editable
  post_fields.attr 'contenteditable', 'true'
  post_fields.addClass 'editable'

  # Select all text when clicking on an editable field
  post_fields.click ->
    $(this).selectText()