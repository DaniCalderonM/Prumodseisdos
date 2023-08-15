require "test_helper"

class PspostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pspost = psposts(:one)
  end

  test "should get index" do
    get psposts_url
    assert_response :success
  end

  test "should get new" do
    get new_pspost_url
    assert_response :success
  end

  test "should create pspost" do
    assert_difference("Pspost.count") do
      post psposts_url, params: { pspost: { description: @pspost.description, title: @pspost.title } }
    end

    assert_redirected_to pspost_url(Pspost.last)
  end

  test "should show pspost" do
    get pspost_url(@pspost)
    assert_response :success
  end

  test "should get edit" do
    get edit_pspost_url(@pspost)
    assert_response :success
  end

  test "should update pspost" do
    patch pspost_url(@pspost), params: { pspost: { description: @pspost.description, title: @pspost.title } }
    assert_redirected_to pspost_url(@pspost)
  end

  test "should destroy pspost" do
    assert_difference("Pspost.count", -1) do
      delete pspost_url(@pspost)
    end

    assert_redirected_to psposts_url
  end
end
