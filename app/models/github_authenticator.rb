# TODO: unit tests
class GithubAuthenticator
  attr_reader :omniauth
  
  def initialize(omniauth)
    @omniauth_hash = omniauth
  end
  
  def user
    signup? ? create_user : update_info
  end
  
  private
  
  def github_uid
    omniauth[:uid]
  end
  
  def signup?
    !user_with_github_uid.exists?
  end
  
  def update_info
    user_with_github_uid.update_attribute :info, info
    user_with_github_uid
  end
  
  def create_user
    User.create github_uid:github_uid, info:omniauth.to_json
  end
  
  def user_with_github_uid
    @user_with_github_uid ||= User.where github_uid:github_uid
  end
end
