require 'test_helper'

class EmergenciesUsersControllerTest < ActionController::TestCase
  setup do
    @emergencies_user = emergencies_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emergencies_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emergencies_user" do
    assert_difference('EmergenciesUser.count') do
      post :create, emergencies_user: { address: @emergencies_user.address, last_name: @emergencies_user.last_name, name: @emergencies_user.name, phone: @emergencies_user.phone, roles_id: @emergencies_user.roles_id }
    end

    assert_redirected_to emergencies_user_path(assigns(:emergencies_user))
  end

  test "should show emergencies_user" do
    get :show, id: @emergencies_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emergencies_user
    assert_response :success
  end

  test "should update emergencies_user" do
    put :update, id: @emergencies_user, emergencies_user: { address: @emergencies_user.address, last_name: @emergencies_user.last_name, name: @emergencies_user.name, phone: @emergencies_user.phone, roles_id: @emergencies_user.roles_id }
    assert_redirected_to emergencies_user_path(assigns(:emergencies_user))
  end

  test "should destroy emergencies_user" do
    assert_difference('EmergenciesUser.count', -1) do
      delete :destroy, id: @emergencies_user
    end

    assert_redirected_to emergencies_users_path
  end
end
