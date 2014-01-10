require 'test_helper'

class RoomAuthorisationTest < ActiveSupport::TestCase
  def setup
    Rails.cache.clear
    @auth = RoomAuthorisation.new occupant:1, room:1
  end
  
  test "valid occupant" do
    Occupant.create id:@auth.occupant, room_id:@auth.room
    assert @auth.valid?
  end
  
  test "invalid occupant" do
    Occupant.create id:1, room_id:0
    refute @auth.valid?
  end
  
  test "cache authorisation" do
    assert_nil Rails.cache.fetch(['room_accessible', @auth.occupant, @auth.room])
    @auth.valid?
    refute Rails.cache.fetch(['room_accessible', @auth.occupant, @auth.room])
  end
end