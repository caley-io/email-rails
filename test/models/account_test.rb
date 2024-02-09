require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    depository = Account::Depository.create!
    @account = Account.create!(team: teams(:caley_team), name: "Google", provider: "Google", email: "jeremy@caley.io")
  end

  test "new account should be valid" do
    assert @account.valid?
  end
end
