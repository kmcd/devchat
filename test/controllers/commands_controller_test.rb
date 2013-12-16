require 'test_helper'

class CommandsControllerTest < ActionController::TestCase
  def js_redirect(action)
    "(function() {\n  $('form#new_command').attr('action', \"/#{action}\").submit();\n\n}).call(this);\n"
  end
  
  def assert_js_redirect(command,controller)
    post :create, { command:{ input:command.to_s }, format:'js' }
    assert :success
    assert_equal js_redirect(controller.to_s), @response.body
  end
  
  test "create message" do
    assert_js_redirect 'Hello', :messages
  end
  
  test "create message with switch" do
    assert_js_redirect '/message Foo' , :messages
  end
  
  test "create message with alias" do
    assert_js_redirect '/msg Foo' , :messages
  end
end
