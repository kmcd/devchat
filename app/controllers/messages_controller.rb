class MessagesController < ApplicationController
  # FIXME: authorisation
  
  def create
    @message = speaker.say params[:message][:content]
  end
  
  def poll
    # TODO: cache room_id, last_message_id
    # TODO: set 304 modified, etags headers
    @messages = listener.messages
  end
  
  private
  
  def speaker
    Speaker.new current_occupant
  end
  
  def listener
    Listener.new room_id:params[:room_id], last_message_id:params[:last_message_id]
  end
end
