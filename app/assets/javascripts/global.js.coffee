# Always get jQuery in on this bitch.
jQuery ($) ->

  # toggles a banner on the given id.
  window.toggleBanner = ( id ) ->
    if $("##{id} .banner").length
      banner = $("##{id} .banner")
      banner.toggle()
    else
      banner = $("##{id}").prepend("<div class='banner'>thing</div>")