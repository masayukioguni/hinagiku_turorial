require 'test_helper'

class HelloControllerTest < ActionController::TestCase
  test "should get wolrd" do
    get :wolrd
    assert_response :success
  end

end
