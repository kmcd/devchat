require 'test_helper'

class OccupantPollTest < ActiveSupport::TestCase
  def setup
    Rails.cache.clear
    @tom = Occupant.create room_id:1, user_id:1
    @chris = Occupant.create room_id:1, user_id:2
  end
  
  def polling(occupant)
    @polling ||= OccupantPoll.new occupant_id:occupant.id, room_id:occupant.room_id
  end
  
  def stub_message_available
    OccupantPoll.any_instance.stubs(:messages?).returns true
    OccupantPoll.any_instance.stubs(:last_message).returns 0
    OccupantPoll.any_instance.stubs :last_polled!
  end
  
  test "no new messages" do
    assert_empty polling(@tom).messages
  end
  
  test "message created by other occupant" do
    stub_message_available
    message = @chris.messages.create content:'ohi!'
    
    assert_equal [message], polling(@tom).messages
  end
  
  test "message created by polling occupant" do
    stub_message_available
    @tom.messages.create content:'ohi!'
    
    assert_equal [], polling(@tom).messages
  end
  
  test "fetch polled messages ONCE only" do
    message = @chris.messages.create content:'ohi!'
    polling(@tom).stubs(:messages?).returns true
    polling(@tom).messages
    @polling = nil
    
    assert_equal [], polling(@tom).messages
  end
  
  test "message created by polling occupant in different session" do
    pending 'figure out controller flow first'
  end
end
