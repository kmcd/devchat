class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action do
    session[:current_user] = 3
    session[:current_room] = 7
    session[:current_occupant] = 5
  end
  
  def current_occupant
    session[:current_occupant]
  end
end
