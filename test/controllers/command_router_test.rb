require 'test_helper'

class CommandRouterTest < ActiveSupport::TestCase
  def assert_message_route(input)
    assert_equal "/messages", CommandRouter.new(input).route
  end
  
  test "Hello -> /messages" do
    assert_message_route "Hello"
  end
  
  test "/message Hello -> /messages" do
    assert_message_route "/message Hello"
  end
  
  test "/msg Hello -> /messages" do
    assert_message_route "/msg Hello"
  end
  
  test "ignore leading whitespace" do
    assert_message_route "  /message Hello"
    assert_message_route "    /message Hello"
    assert_message_route "    /msg adf"
  end
end
