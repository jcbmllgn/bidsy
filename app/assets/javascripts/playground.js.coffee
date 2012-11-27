$(document).bind 'playground_application.load', (e,obj) =>

  $('.toggle-modal').click ->
    toggle_modal()

  # alert checkbox set 2's value
  $('#meats-value').click -> alert $('#meats').checkboxesValue()