require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { age: @teacher.age, comp_work: @teacher.comp_work, formal_training: @teacher.formal_training, gender: @teacher.gender, informal_training: @teacher.informal_training, other_sources_student: @teacher.other_sources_student, personal_use: @teacher.personal_use, professional_use: @teacher.professional_use, subject: @teacher.subject, training_needs: @teacher.training_needs }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    put :update, id: @teacher, teacher: { age: @teacher.age, comp_work: @teacher.comp_work, formal_training: @teacher.formal_training, gender: @teacher.gender, informal_training: @teacher.informal_training, other_sources_student: @teacher.other_sources_student, personal_use: @teacher.personal_use, professional_use: @teacher.professional_use, subject: @teacher.subject, training_needs: @teacher.training_needs }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
