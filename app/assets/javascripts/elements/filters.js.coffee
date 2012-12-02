jQuery ($) ->

  $range = $('.range-picker')
  min = $range.data('range-min')
  max = $range.data('range-max')

  console.log min + '<min & max>' + max

# Alignment fix, range pickers must be imbedded in eithr p, h6, or h5 tags:
  $range.parent().css('display','inline')

  $range.html('<span class="up-arrow"></span><span class="day-container">' + max + '</span><span class="down-arrow"></span>')