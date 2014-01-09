require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room, @user = Room.create, User.create
  end
  
  test "empty" do
    assert_equal [], @room.occupants
  end
  
  test "enter" do
    @room.enter @user
    assert_equal [@user.id], @room.occupants
  end
  
  test "exit" do
    @room.enter @user
    @room.exit @user
    assert_equal [], @room.occupants
  end
  
  test "no duplicate occupants" do
    2.times { @room.enter @user }
    assert_equal [@user.id], @room.occupants
  end
end
