require "test_helper"

class PsusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get psusers_index_url
    assert_response :success
  end

  test "should get show" do
    get psusers_show_url
    assert_response :success
  end

  test "should get new" do
    get psusers_new_url
    assert_response :success
  end

  test "should get edit" do
    get psusers_edit_url
    assert_response :success
  end
end
