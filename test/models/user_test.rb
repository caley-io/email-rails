require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:bob)
  end
end
