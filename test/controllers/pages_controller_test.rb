require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Home - Lugnuts"
  end

  test "should get tips" do
    get :tips
    assert_response :success
    assert_select "title", "Tips - Lugnuts"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact - Lugnuts"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About - Lugnuts"
  end

end
