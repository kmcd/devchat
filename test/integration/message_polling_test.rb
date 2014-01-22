require 'test_helper'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 4

class MessagePollingTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  def setup
    @room = Room.create! name:'dev'
    @user = User.create! info:{extra:{raw_info:{login:'chris'}}}
  end
  
  test "no messages in an empty room" do
    visit room_path(@room)
    assert page.has_no_css?('.room .message:not(.new)')
  end
  
  test "after creation message appears in room" do
    visit room_path(@room)
    message = @room.messages.create! user:@user, input:'hi!'
    assert page.has_css?(".room .message[data-message-id='#{message.id}']")
  end
end
