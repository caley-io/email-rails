require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_registration_url
    assert_response :success
  end

  private

  def in_hosted_app
    ENV["HOSTED"] = "true"
    yield
  ensure
    ENV["HOSTED"] = nil
  end
end
