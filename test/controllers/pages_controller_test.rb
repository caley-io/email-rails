require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:bob)
  end

  test "inbox" do
    get root_path
    assert_response :ok
  end
end
