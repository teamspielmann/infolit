require 'test_helper'

class ResearchCsControllerTest < ActionController::TestCase
  setup do
    @research_c = research_cs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_cs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_c" do
    assert_difference('ResearchC.count') do
      post :create, research_c: { score: @research_c.score, user_id: @research_c.user_id }
    end

    assert_redirected_to research_c_path(assigns(:research_c))
  end

  test "should show research_c" do
    get :show, id: @research_c
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_c
    assert_response :success
  end

  test "should update research_c" do
    put :update, id: @research_c, research_c: { score: @research_c.score, user_id: @research_c.user_id }
    assert_redirected_to research_c_path(assigns(:research_c))
  end

  test "should destroy research_c" do
    assert_difference('ResearchC.count', -1) do
      delete :destroy, id: @research_c
    end

    assert_redirected_to research_cs_path
  end
end
