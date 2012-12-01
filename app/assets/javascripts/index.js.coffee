jQuery ($) ->

# Coffee for the sort boxes on the top of the /posts (search results) page. 

  $('.filter-unit').click ->

# First, resetting any other filter arrow to the dot
    $(this).siblings().children('span.filter-arrow').removeClass('current-filter-down current-filter-up')
    sortSelection = $(this).children('span.filter-arrow') # storing the arrow span

    # if currently down, change to up
    if sortSelection.hasClass 'current-filter-down'
      sortSelection.removeClass('current-filter-down').addClass('current-filter-up')

    # if currently up, change to down
    else if sortSelection.hasClass 'current-filter-up'
      sortSelection.removeClass('current-filter-up').addClass('current-filter-down')

    # if not current filter add down arrow
    else
      sortSelection.addClass 'current-filter-down'

# This unselects any seleted text. It's to fix a weird selection thing that was happening when clicking on the filters very fast
    document.selection.empty();
