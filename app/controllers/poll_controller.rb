# TODO: change to normal Rails contoller (ie dont pre-optimize)
class PollController < ActionController::Metal
  def index
    self.response_body = params
  end
end
