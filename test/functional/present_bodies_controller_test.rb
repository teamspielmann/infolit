require 'test_helper'

class PresentBodiesControllerTest < ActionController::TestCase
  setup do
    @present_body = present_bodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:present_bodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create present_body" do
    assert_difference('PresentBody.count') do
      post :create, present_body: { body_a: @present_body.body_a, body_b: @present_body.body_b, body_c: @present_body.body_c, score_a: @present_body.score_a, score_b: @present_body.score_b, score_c: @present_body.score_c }
    end

    assert_redirected_to present_body_path(assigns(:present_body))
  end

  test "should show present_body" do
    get :show, id: @present_body
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @present_body
    assert_response :success
  end

  test "should update present_body" do
    put :update, id: @present_body, present_body: { body_a: @present_body.body_a, body_b: @present_body.body_b, body_c: @present_body.body_c, score_a: @present_body.score_a, score_b: @present_body.score_b, score_c: @present_body.score_c }
    assert_redirected_to present_body_path(assigns(:present_body))
  end

  test "should destroy present_body" do
    assert_difference('PresentBody.count', -1) do
      delete :destroy, id: @present_body
    end

    assert_redirected_to present_bodies_path
  end
end
