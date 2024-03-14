require "test_helper"

class EmailThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:bob)
  end

  test "inbox" do
    get root_path
    assert_response :ok
  end

  test "reply_later" do
    get reply_later_email_threads_path
    assert_response :ok
  end

  test "all" do
    get all_email_threads_path
    assert_response :ok
  end
end
