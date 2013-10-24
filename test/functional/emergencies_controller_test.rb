require 'test_helper'

class EmergenciesControllerTest < ActionController::TestCase
  setup do
    @emergency = emergencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emergencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emergency" do
    assert_difference('Emergency.count') do
      post :create, emergency: { comments: @emergency.comments, emergencies_types_id: @emergency.emergencies_types_id, emergency_end: @emergency.emergency_end, emergency_start: @emergency.emergency_start, management_description: @emergency.management_description, zones_id: @emergency.zones_id }
    end

    assert_redirected_to emergency_path(assigns(:emergency))
  end

  test "should show emergency" do
    get :show, id: @emergency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emergency
    assert_response :success
  end

  test "should update emergency" do
    put :update, id: @emergency, emergency: { comments: @emergency.comments, emergencies_types_id: @emergency.emergencies_types_id, emergency_end: @emergency.emergency_end, emergency_start: @emergency.emergency_start, management_description: @emergency.management_description, zones_id: @emergency.zones_id }
    assert_redirected_to emergency_path(assigns(:emergency))
  end

  test "should destroy emergency" do
    assert_difference('Emergency.count', -1) do
      delete :destroy, id: @emergency
    end

    assert_redirected_to emergencies_path
  end
end
