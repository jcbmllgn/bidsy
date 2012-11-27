jQuery ($) ->
# coffee for aligning widget tooltips on the right or left side depending on where the widget is.

# coffee for fading in and out all widget tooltips
  $widget = $('.widget') # storing all widgets

  if $widget.children('.widget-tooltip').length > 0
    $widget
      .mouseenter ->
        newHeight = $(this).height() + 5 # Using this variable to set the correct height for the widgets
        $(this)
          .children('.widget-tooltip').css('height',newHeight + 'px').fadeIn() # setting the correct height then fading these suckers in


      .mouseleave ->
        $(this).children('.widget-tooltip').fadeOut()