class SessionsController < ApplicationController
  def create
    @current_user = GithubAuthenticator.new(env['omniauth.auth']).user
    redirect_to root_path
  end
end
