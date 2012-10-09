require 'test_helper'

class PartScoresControllerTest < ActionController::TestCase
  setup do
    @part_score = part_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_score" do
    assert_difference('PartScore.count') do
      post :create, part_score: { database_choice: @part_score.database_choice, end_time: @part_score.end_time, score: @part_score.score, searches_count: @part_score.searches_count, start_time: @part_score.start_time, time_taken: @part_score.time_taken, vehicle_type: @part_score.vehicle_type }
    end

    assert_redirected_to part_score_path(assigns(:part_score))
  end

  test "should show part_score" do
    get :show, id: @part_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_score
    assert_response :success
  end

  test "should update part_score" do
    put :update, id: @part_score, part_score: { database_choice: @part_score.database_choice, end_time: @part_score.end_time, score: @part_score.score, searches_count: @part_score.searches_count, start_time: @part_score.start_time, time_taken: @part_score.time_taken, vehicle_type: @part_score.vehicle_type }
    assert_redirected_to part_score_path(assigns(:part_score))
  end

  test "should destroy part_score" do
    assert_difference('PartScore.count', -1) do
      delete :destroy, id: @part_score
    end

    assert_redirected_to part_scores_path
  end
end
