require 'test_helper'

class RoomAccessTest < ActiveSupport::TestCase
  def setup
    @access = RoomAccess.new user:User.create, room:Room.create
  end
  
  test "enter creates occupancy" do
    assert_empty @access.room.users
    @access.enter
    assert_includes @access.room.users, @access.user
  end
  
  test "enter creates occupancy presence" do
    @access.enter
    assert @access.room.occupants.first.present
  end
  
  test "exit removes occupancy presence" do
    @access.enter
    @access.exit
    refute @access.room.occupants.first.present
  end
end