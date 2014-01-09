require 'test_helper'

class RoomObserverTest < ActiveSupport::TestCase
  def setup
    Rails.cache.clear
    @room, @user = Room.create, User.create
  end
  
  test "update cache on occupant entry" do
    @room.enter @user
    assert_equal @room.occupants, Rails.cache.fetch(['occupants', @room])
  end
  
  test "update cache on occupant exit" do
    @room.enter @user
    @room.exit @user
    assert_equal @room.occupants, Rails.cache.fetch(['occupants', @room])
  end
end
