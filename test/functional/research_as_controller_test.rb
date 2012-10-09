require 'test_helper'

class ResearchAsControllerTest < ActionController::TestCase
  setup do
    @research_a = research_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_as)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_a" do
    assert_difference('ResearchA.count') do
      post :create, research_a: { score: @research_a.score, user_id: @research_a.user_id }
    end

    assert_redirected_to research_a_path(assigns(:research_a))
  end

  test "should show research_a" do
    get :show, id: @research_a
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_a
    assert_response :success
  end

  test "should update research_a" do
    put :update, id: @research_a, research_a: { score: @research_a.score, user_id: @research_a.user_id }
    assert_redirected_to research_a_path(assigns(:research_a))
  end

  test "should destroy research_a" do
    assert_difference('ResearchA.count', -1) do
      delete :destroy, id: @research_a
    end

    assert_redirected_to research_as_path
  end
end
