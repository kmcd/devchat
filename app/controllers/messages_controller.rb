class MessagesController < ApplicationController
  helper_method :listener
  # FIXME: authorisation
  
  def create
    @message = speaker.say params[:message][:content]
  end
  
  def poll
    if listener.messages?
      fresh_when listener.last_modified_etags
    else
      render nothing:true
    end
  end
  
  private
  
  def speaker
    Speaker.new current_occupant
  end
  
  def listener
    @listener ||= Listener.new room_id:params[:room_id], 
      message_id:params[:message_id]
  end
end
