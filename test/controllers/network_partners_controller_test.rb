require 'test_helper'

class NetworkPartnersControllerTest < ActionController::TestCase
  setup do
    @network_partner = network_partners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_partners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_partner" do
    assert_difference('NetworkPartner.count') do
      post :create, network_partner: { name: @network_partner.name, urn: @network_partner.urn }
    end

    assert_redirected_to network_partner_path(assigns(:network_partner))
  end

  test "should show network_partner" do
    get :show, id: @network_partner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_partner
    assert_response :success
  end

  test "should update network_partner" do
    patch :update, id: @network_partner, network_partner: { name: @network_partner.name, urn: @network_partner.urn }
    assert_redirected_to network_partner_path(assigns(:network_partner))
  end

  test "should destroy network_partner" do
    assert_difference('NetworkPartner.count', -1) do
      delete :destroy, id: @network_partner
    end

    assert_redirected_to network_partners_path
  end
end
