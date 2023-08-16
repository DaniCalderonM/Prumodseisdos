require "test_helper"

class AppliesControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @pspost = psposts(:first_pspost)
  end
  
  test "deberia crear una aplicacion" do
    assert_difference "Apply.count", 1 do
      pspost psposts_path, params:
      { apply: {
        kind: "Aplicar"
      }}
      end
      assert_redirect_to pspost_path(Post.last)
      assert_response :found
      assert_equal 302, response.status
      assert_equal "text/html", response.media_type
      assert_equal "utf-8", response.charset
  end
end
