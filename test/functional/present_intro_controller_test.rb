require 'test_helper'

class PresentIntroControllerTest < ActionController::TestCase
  test "should get present" do
    get :present
    assert_response :success
  end

end
