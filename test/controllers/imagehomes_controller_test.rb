require 'test_helper'

class ImagehomesControllerTest < ActionController::TestCase
  setup do
    @imagehome = imagehomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imagehomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imagehome" do
    assert_difference('Imagehome.count') do
      post :create, imagehome: { title: @imagehome.title }
    end

    assert_redirected_to imagehome_path(assigns(:imagehome))
  end

  test "should show imagehome" do
    get :show, id: @imagehome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imagehome
    assert_response :success
  end

  test "should update imagehome" do
    patch :update, id: @imagehome, imagehome: { title: @imagehome.title }
    assert_redirected_to imagehome_path(assigns(:imagehome))
  end

  test "should destroy imagehome" do
    assert_difference('Imagehome.count', -1) do
      delete :destroy, id: @imagehome
    end

    assert_redirected_to imagehomes_path
  end
end
