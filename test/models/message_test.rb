require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    Rails.cache.clear
    create_occupants 1..2
  end
  
  def latest_for_occupant(room_id:1, user_id:1, since:10.seconds.ago)
    Message.latest_for_occupant room_id:room_id, user_id:user_id, since:since
  end
  
  def create_message(room_id:1, user_id:1)
    Message.create room_id:room_id, user_id:user_id, content:'ohi!'
  end
  
  test "empty when no occupant messages exist" do
    assert_empty latest_for_occupant
  end
  
  test "empty when no messages from OTHER occupants" do
    create_message
    assert_empty latest_for_occupant
  end
  
  test "fetch messages when available from other occupants" do
    message = create_message
    assert_equal [message], latest_for_occupant(user_id:2)
  end
  
  test "occupant messages NOT available after fetch" do
    message = create_message
    latest_for_occupant
    assert_empty latest_for_occupant
  end
end
