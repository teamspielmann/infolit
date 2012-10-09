require 'test_helper'

class RhinoControllerTest < ActionController::TestCase
  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get answers" do
    get :answers
    assert_response :success
  end

  test "should get university" do
    get :university
    assert_response :success
  end

end
