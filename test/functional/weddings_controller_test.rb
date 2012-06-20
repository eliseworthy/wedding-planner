require 'test_helper'

class WeddingsControllerTest < ActionController::TestCase
  setup do
    @wedding = weddings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weddings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wedding" do
    assert_difference('Wedding.count') do
      post :create, wedding: { description: @wedding.description, name: @wedding.name, photo: @wedding.photo, user_id: @wedding.user_id }
    end

    assert_response 201
  end

  test "should show wedding" do
    get :show, id: @wedding
    assert_response :success
  end

  test "should update wedding" do
    put :update, id: @wedding, wedding: { description: @wedding.description, name: @wedding.name, photo: @wedding.photo, user_id: @wedding.user_id }
    assert_response 204
  end

  test "should destroy wedding" do
    assert_difference('Wedding.count', -1) do
      delete :destroy, id: @wedding
    end

    assert_response 204
  end
end
