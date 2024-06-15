require "test_helper"

class DefendantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get defendants_index_url
    assert_response :success
  end

  test "should get show" do
    get defendants_show_url
    assert_response :success
  end

  test "should get new" do
    get defendants_new_url
    assert_response :success
  end

  test "should get edit" do
    get defendants_edit_url
    assert_response :success
  end
end
