require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def setup
    @caley_team = teams(:caley_team)
  end

  test "should have many users" do
    assert_equal 1, @caley_team.users.size
    assert @caley_team.users.include?(users(:bob))
  end

  test "should have many EmailServers" do
    assert_equal 1, @caley_team.accounts.size
  end

  test "should destroy dependent users" do
    assert_difference("User.count", -@caley_team.users.count) do
      @caley_team.destroy
    end
  end

  test "should destroy dependent EmailServers" do
    assert_difference("EmailServer.count", -@caley_team.accounts.count) do
      @caley_team.destroy
    end
  end
end
