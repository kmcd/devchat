require 'test_helper'

class CommandTest < ActiveSupport::TestCase
  def assert_valid_command(type)
    assert Command.new(type:type.to_s.capitalize).valid?
  end
  
  test "valid command types" do
    assert_valid_command :message
    assert_valid_command :room
  end
  
  test "no arbitrary commands" do
    assert_raise ActiveRecord::SubclassNotFound do
      Command.new(type:'Foo').valid?
    end
  end
  
  test "arbitrary command converted to message" do
    assert_equal 'Message', Command.new(input:'/foo').set_type
  end
end
