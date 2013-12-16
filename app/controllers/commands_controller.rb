class CommandsController < ApplicationController
  def create
    @router = CommandRouter.new params[:command][:input]
    
    respond_to do |format|
      format.js do
        render @router.route ? 'redirect' : 'unknown'
      end
    end
  end
end
