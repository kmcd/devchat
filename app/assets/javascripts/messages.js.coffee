# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@Message =
  poll: ->
    setTimeout @request, 3000

  request: ->
    room_id = $(".room").last().data "room-id"
    message_id = $(".room .message").not('.new').last().data "message-id"
    
    ajax = $.ajax url:'/messages/poll', ifModified:true, \
      data:{ room_id:room_id, message_id:message_id }
      
    ajax.done = ( data, textStatus, jqXHR ) ->
      eval(data)
      
    ajax.always = ->
      Message.poll()
      
  # TODO: move to Keyboard handler class
  sumbit_on_return: ->
    # TODO: ensure this works for all browsers & key combinations; eg shift
    RETURN_KEY = 13
    
    $('body').delegate '#new_message #message_input', 'keydown', (event) ->
      return unless event.which == RETURN_KEY
      event.preventDefault()
      $('#new_message').submit()
      true

$(document).ready ->
  Message.poll()
  Message.sumbit_on_return()
