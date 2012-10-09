require 'test_helper'

class PresentTitlesControllerTest < ActionController::TestCase
  setup do
    @present_title = present_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:present_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create present_title" do
    assert_difference('PresentTitle.count') do
      post :create, present_title: { score: @present_title.score, title: @present_title.title }
    end

    assert_redirected_to present_title_path(assigns(:present_title))
  end

  test "should show present_title" do
    get :show, id: @present_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @present_title
    assert_response :success
  end

  test "should update present_title" do
    put :update, id: @present_title, present_title: { score: @present_title.score, title: @present_title.title }
    assert_redirected_to present_title_path(assigns(:present_title))
  end

  test "should destroy present_title" do
    assert_difference('PresentTitle.count', -1) do
      delete :destroy, id: @present_title
    end

    assert_redirected_to present_titles_path
  end
end
