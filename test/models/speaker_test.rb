require 'test_helper'

class SpeakerTest < ActiveSupport::TestCase
  def setup
    @speaker = Speaker.new 1, 1
    @speaker.stubs :notify_chatters
    @speaker.stubs :update_transcript_history
  end
  
  test "message must have content" do
    refute @speaker.say ''
  end
  
  test "persist message" do
    message = @speaker.say 'hello'
    assert message.persisted?
  end
end
