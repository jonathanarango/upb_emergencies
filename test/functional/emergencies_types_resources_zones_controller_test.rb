require 'test_helper'

class EmergenciesTypesResourcesZonesControllerTest < ActionController::TestCase
  setup do
    @emergencies_types_resources_zone = emergencies_types_resources_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emergencies_types_resources_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emergencies_types_resources_zone" do
    assert_difference('EmergenciesTypesResourcesZone.count') do
      post :create, emergencies_types_resources_zone: { emergencies_types_id: @emergencies_types_resources_zone.emergencies_types_id, resources_zones_id: @emergencies_types_resources_zone.resources_zones_id }
    end

    assert_redirected_to emergencies_types_resources_zone_path(assigns(:emergencies_types_resources_zone))
  end

  test "should show emergencies_types_resources_zone" do
    get :show, id: @emergencies_types_resources_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emergencies_types_resources_zone
    assert_response :success
  end

  test "should update emergencies_types_resources_zone" do
    put :update, id: @emergencies_types_resources_zone, emergencies_types_resources_zone: { emergencies_types_id: @emergencies_types_resources_zone.emergencies_types_id, resources_zones_id: @emergencies_types_resources_zone.resources_zones_id }
    assert_redirected_to emergencies_types_resources_zone_path(assigns(:emergencies_types_resources_zone))
  end

  test "should destroy emergencies_types_resources_zone" do
    assert_difference('EmergenciesTypesResourcesZone.count', -1) do
      delete :destroy, id: @emergencies_types_resources_zone
    end

    assert_redirected_to emergencies_types_resources_zones_path
  end
end
