jQuery ($) ->

#   $range = $('.range')
#   min = $range.data('range-min')
#   max = $range.data('range-max')

# # Alignment fix, range pickers must be imbedded in eithr p, h6, or h5 tags:

#   if $range
#     console.log 'There is a range on this page with a min of ' + min + ' and a max of ' + max
#     $('head').append '<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>'

#   $range.html('<p class="range-min">' + min + '</p><p class="range-max">' + max + '</p><div class="min-picker"></div>')
#   $('.min-picker').draggable({
#       containment: "parent",
#       snap: '.range'
#     })