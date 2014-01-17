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
  
  test "notify other chatters" do
    @speaker.unstub :notify_chatters
    message, notification = mock('notification'), mock('message')
    @speaker.stubs(:message).returns message
    
    ChatNotification.expects(:new).with(message).returns notification
    notification.expects :enqueue
    
    @speaker.say 'hello'
  end
  
  test "update chat transcript" do
    @speaker.unstub :update_transcript_history
    message, notification = mock('notification'), mock('message')
    @speaker.stubs(:message).returns message
    
    TranscriptUpdate.expects(:new).with(message).returns notification
    notification.expects :enqueue
    
    @speaker.say 'hello'
  end
  
  test "returns message" do
    message  = @speaker.say 'hello'
    assert_equal 'hello', message.input
  end
end
