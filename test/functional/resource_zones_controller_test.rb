require 'test_helper'

class ResourceZonesControllerTest < ActionController::TestCase
  setup do
    @resource_zone = resource_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_zone" do
    assert_difference('ResourceZone.count') do
      post :create, resource_zone: { resource_id: @resource_zone.resource_id, zone_id: @resource_zone.zone_id }
    end

    assert_redirected_to resource_zone_path(assigns(:resource_zone))
  end

  test "should show resource_zone" do
    get :show, id: @resource_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_zone
    assert_response :success
  end

  test "should update resource_zone" do
    put :update, id: @resource_zone, resource_zone: { resource_id: @resource_zone.resource_id, zone_id: @resource_zone.zone_id }
    assert_redirected_to resource_zone_path(assigns(:resource_zone))
  end

  test "should destroy resource_zone" do
    assert_difference('ResourceZone.count', -1) do
      delete :destroy, id: @resource_zone
    end

    assert_redirected_to resource_zones_path
  end
end
