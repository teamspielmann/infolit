require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: { ict_c_teacher: @questionnaire.ict_c_teacher, ict_no_teacher: @questionnaire.ict_no_teacher, ict_opportunities_out: @questionnaire.ict_opportunities_out, ict_opportunities_school: @questionnaire.ict_opportunities_school, internet_outside: @questionnaire.internet_outside, internet_school: @questionnaire.internet_school, sharing_computer: @questionnaire.sharing_computer }
    end

    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    put :update, id: @questionnaire, questionnaire: { ict_c_teacher: @questionnaire.ict_c_teacher, ict_no_teacher: @questionnaire.ict_no_teacher, ict_opportunities_out: @questionnaire.ict_opportunities_out, ict_opportunities_school: @questionnaire.ict_opportunities_school, internet_outside: @questionnaire.internet_outside, internet_school: @questionnaire.internet_school, sharing_computer: @questionnaire.sharing_computer }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
end
