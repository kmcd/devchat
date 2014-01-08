require 'test_helper'

class MessageObserverTest < ActiveSupport::TestCase
  def create_occupants(range)
    Rails.cache.write ['room_occupants', 1], range.to_a
  end
  
  def setup
    Rails.cache.clear
    create_occupants 1..2
    @message = Message.create room_id:1, user_id:1, content:'ohi!'
  end
  
  test "new message notification for room occupants" do
    assert_equal true, Rails.cache.
      fetch(['room', @message.room_id, 'user', 2])
  end
  
  test "NO new message notification for message creator" do
    assert_nil Rails.cache.fetch(['room', @message.room_id, 'user', 
      @message.user_id])
  end
end
