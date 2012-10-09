require 'test_helper'

class ResearchBsControllerTest < ActionController::TestCase
  setup do
    @research_b = research_bs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_bs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_b" do
    assert_difference('ResearchB.count') do
      post :create, research_b: { score: @research_b.score, user_id: @research_b.user_id }
    end

    assert_redirected_to research_b_path(assigns(:research_b))
  end

  test "should show research_b" do
    get :show, id: @research_b
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_b
    assert_response :success
  end

  test "should update research_b" do
    put :update, id: @research_b, research_b: { score: @research_b.score, user_id: @research_b.user_id }
    assert_redirected_to research_b_path(assigns(:research_b))
  end

  test "should destroy research_b" do
    assert_difference('ResearchB.count', -1) do
      delete :destroy, id: @research_b
    end

    assert_redirected_to research_bs_path
  end
end
