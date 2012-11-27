jQuery ($) ->
# coffee for aligning widget tooltips on the right or left side depending on where the widget is.

# coffee for fading in and out all widget tooltips
  $widget = $('.widget') # storing all widgets

  if $widget.children('.widget-tooltip').length > 0
    $widget
      .mouseenter ->
        newHeight = $(this).height() + 5
        $(this)
          .children('.widget-tooltip').css('height',newHeight + 'px').fadeIn()


      .mouseleave ->
        $(this).children('.widget-tooltip').fadeOut()