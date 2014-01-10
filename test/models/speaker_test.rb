require 'test_helper'

class SpeakerTest < ActiveSupport::TestCase
  def setup
    Rails.cache.clear
    Message.any_instance.stubs(:room).returns stub(id:1)
    @tom = Speaker.new 1
  end
  
  test "send message to room" do
    message = @tom.say 'foo'
    assert_equal [message], Message.all
  end
  
  test "update last message cache" do
    message = @tom.say 'foo'
    assert_equal message.id, Rails.cache.fetch(['last_message', 1])
  end
end
