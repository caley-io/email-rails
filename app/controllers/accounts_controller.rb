class AccountsController < ApplicationController
  before_action :authenticate_user!

  def new
    Account.new
  end

  def show
  end

  def create
    @account = Current.team.accounts.build(account_params)

    if @account.save
      redirect_to accounts_path, notice: t(".success")
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :provider, :email, :type)
  end

  def account_type_class
      Account # Default to Account if type is not provided or invalid
  end
end
