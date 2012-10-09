require 'test_helper'

class PartDbsControllerTest < ActionController::TestCase
  setup do
    @part_db = part_dbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_dbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_db" do
    assert_difference('PartDb.count') do
      post :create, part_db: { keywords: @part_db.keywords, model: @part_db.model, part: @part_db.part, store_location: @part_db.store_location, store_name: @part_db.store_name }
    end

    assert_redirected_to part_db_path(assigns(:part_db))
  end

  test "should show part_db" do
    get :show, id: @part_db
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_db
    assert_response :success
  end

  test "should update part_db" do
    put :update, id: @part_db, part_db: { keywords: @part_db.keywords, model: @part_db.model, part: @part_db.part, store_location: @part_db.store_location, store_name: @part_db.store_name }
    assert_redirected_to part_db_path(assigns(:part_db))
  end

  test "should destroy part_db" do
    assert_difference('PartDb.count', -1) do
      delete :destroy, id: @part_db
    end

    assert_redirected_to part_dbs_path
  end
end
