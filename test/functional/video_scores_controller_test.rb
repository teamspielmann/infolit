require 'test_helper'

class VideoScoresControllerTest < ActionController::TestCase
  setup do
    @video_score = video_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_score" do
    assert_difference('VideoScore.count') do
      post :create, video_score: { score: @video_score.score, searches: @video_score.searches, time: @video_score.time }
    end

    assert_redirected_to video_score_path(assigns(:video_score))
  end

  test "should show video_score" do
    get :show, id: @video_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_score
    assert_response :success
  end

  test "should update video_score" do
    put :update, id: @video_score, video_score: { score: @video_score.score, searches: @video_score.searches, time: @video_score.time }
    assert_redirected_to video_score_path(assigns(:video_score))
  end

  test "should destroy video_score" do
    assert_difference('VideoScore.count', -1) do
      delete :destroy, id: @video_score
    end

    assert_redirected_to video_scores_path
  end
end
