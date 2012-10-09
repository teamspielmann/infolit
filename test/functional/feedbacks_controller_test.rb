require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, feedback: { access_1: @feedback.access_1, access_2: @feedback.access_2, access_3: @feedback.access_3, access_4: @feedback.access_4, access_t: @feedback.access_t, define_1: @feedback.define_1, define_2: @feedback.define_2, define_3: @feedback.define_3, define_t: @feedback.define_t, evaluate_1: @feedback.evaluate_1, evaluate_2: @feedback.evaluate_2, evaluate_3: @feedback.evaluate_3, evaluate_4: @feedback.evaluate_4, evaluate_t: @feedback.evaluate_t, il_total: @feedback.il_total, use_1: @feedback.use_1, use_2: @feedback.use_2, use_t: @feedback.use_t }
    end

    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should show feedback" do
    get :show, id: @feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback
    assert_response :success
  end

  test "should update feedback" do
    put :update, id: @feedback, feedback: { access_1: @feedback.access_1, access_2: @feedback.access_2, access_3: @feedback.access_3, access_4: @feedback.access_4, access_t: @feedback.access_t, define_1: @feedback.define_1, define_2: @feedback.define_2, define_3: @feedback.define_3, define_t: @feedback.define_t, evaluate_1: @feedback.evaluate_1, evaluate_2: @feedback.evaluate_2, evaluate_3: @feedback.evaluate_3, evaluate_4: @feedback.evaluate_4, evaluate_t: @feedback.evaluate_t, il_total: @feedback.il_total, use_1: @feedback.use_1, use_2: @feedback.use_2, use_t: @feedback.use_t }
    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should destroy feedback" do
    assert_difference('Feedback.count', -1) do
      delete :destroy, id: @feedback
    end

    assert_redirected_to feedbacks_path
  end
end
