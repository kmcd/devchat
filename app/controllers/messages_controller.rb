class MessagesController < ApplicationController
  def create
    @message = Command.create_and_become command_params,
      session[:current_user], session[:current_room]
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def command_params
    params.require(:command).permit :input
  end
end
