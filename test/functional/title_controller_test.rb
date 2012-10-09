require 'test_helper'

class TitleControllerTest < ActionController::TestCase
  test "should get title_page" do
    get :title_page
    assert_response :success
  end

end
