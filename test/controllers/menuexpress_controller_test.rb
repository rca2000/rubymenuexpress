require 'test_helper'

class MenuexpressControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get contactenos" do
    get :contactenos
    assert_response :success
  end

  test "should get nosotros" do
    get :nosotros
    assert_response :success
  end

  test "should get servicio" do
    get :servicio
    assert_response :success
  end

end
