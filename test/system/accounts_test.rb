require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    sign_in @user = users(:bob)
  end
end
