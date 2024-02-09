require "test_helper"

class CurrentTest < ActiveSupport::TestCase
  test "team returns user team" do
    user = users(:bob)
    Current.user = user
    assert_equal user.team, Current.team
  end
end
