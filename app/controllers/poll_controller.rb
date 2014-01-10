class PollController < ActionController::Metal
  def index
    self.response_body = params
  end
end
