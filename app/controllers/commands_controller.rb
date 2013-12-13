class CommandsController < ApplicationController
  def create
    @command = Command.create_and_become command_params
    
    respond_to do |format|
      format.js { render action }
    end
  end
  
  private
  
  def action
    @command.type.downcase.pluralize << '/show'
  end
  
  def command_params
    params.require(:command).permit :input
  end
end
