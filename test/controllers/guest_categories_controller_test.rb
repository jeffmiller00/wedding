require 'test_helper'

class GuestCategoriesControllerTest < ActionController::TestCase
  setup do
    @guest_category = guest_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guest_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest_category" do
    assert_difference('GuestCategory.count') do
      post :create, guest_category: { default_likelihood: @guest_category.default_likelihood, name: @guest_category.name }
    end

    assert_redirected_to guest_category_path(assigns(:guest_category))
  end

  test "should show guest_category" do
    get :show, id: @guest_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest_category
    assert_response :success
  end

  test "should update guest_category" do
    patch :update, id: @guest_category, guest_category: { default_likelihood: @guest_category.default_likelihood, name: @guest_category.name }
    assert_redirected_to guest_category_path(assigns(:guest_category))
  end

  test "should destroy guest_category" do
    assert_difference('GuestCategory.count', -1) do
      delete :destroy, id: @guest_category
    end

    assert_redirected_to guest_categories_path
  end
end
