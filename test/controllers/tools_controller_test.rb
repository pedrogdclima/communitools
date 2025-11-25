require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tools_show_url
    assert_response :success
  end

  test "should get create" do
    get tools_create_url
    assert_response :success
  end

  test "should get new" do
    get tools_new_url
    assert_response :success
  end

  test "should get edit" do
    get tools_edit_url
    assert_response :success
  end
end
