require "test_helper"

class EmailThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:bob)
  end

  test "inbox" do
    get root_path
    assert_response :ok
  end

  test "new" do
    get new_email_thread_path
    assert_response :ok
  end

  # TODO: Create fixtures for email_threads
  # test "show" do
  #   get email_thread_path(email_threads(:one))
  #   assert_response :ok
  # end
end
