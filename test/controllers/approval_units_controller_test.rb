require 'test_helper'

class ApprovalUnitsControllerTest < ActionController::TestCase
  setup do
    @approval_unit = approval_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approval_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approval_unit" do
    assert_difference('ApprovalUnit.count') do
      post :create, approval_unit: { page_id: @approval_unit.page_id, position: @approval_unit.position, type: @approval_unit.type, value: @approval_unit.value }
    end

    assert_redirected_to approval_unit_path(assigns(:approval_unit))
  end

  test "should show approval_unit" do
    get :show, id: @approval_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approval_unit
    assert_response :success
  end

  test "should update approval_unit" do
    patch :update, id: @approval_unit, approval_unit: { page_id: @approval_unit.page_id, position: @approval_unit.position, type: @approval_unit.type, value: @approval_unit.value }
    assert_redirected_to approval_unit_path(assigns(:approval_unit))
  end

  test "should destroy approval_unit" do
    assert_difference('ApprovalUnit.count', -1) do
      delete :destroy, id: @approval_unit
    end

    assert_redirected_to approval_units_path
  end
end
