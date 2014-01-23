# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@Room = 
  scroll_bottom: ->
    # FIXME: this is really buggy
    $("html,body").animate({ scrollTop: $('body').height() }, 0)

$(document).ready ->
  Room.scroll_bottom()
