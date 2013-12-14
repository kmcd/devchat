class CommandsController < ApplicationController
  def create
    # TODO: move to factory/builder and instantiate instance variable
    @command = Command.create_and_become command_params,
      session[:current_user], session[:current_room]
    
    respond_to do |format|
      format.js { render action }
    end
  end
  
  private
  
  def action
    @command.type.downcase
  end
  
  def command_params
    params.require(:command).permit :input
  end
end
