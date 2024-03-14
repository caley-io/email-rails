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
    get reply_later_path
    assert_response :ok
  end

  test "all" do
    get all_path
    assert_response :ok
  end

  text "new" do
    get new_email_thread_path
    assert_response :ok
  end

  test "show" do
    get email_thread_path(email_threads(:one))
    assert_response :ok
  end
end
