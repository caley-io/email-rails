class EmailServersController < ApplicationController
  before_action :authenticate_user!

  def new
    EmailServer.new
  end

  def show
  end

  def create
    @email_server = Current.team.accounts.build(account_params)

    if @email_server.save
      redirect_to accounts_path, notice: t(".success")
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:email_server).permit(:name, :provider, :email, :type)
  end

  def account_type_class
    EmailServer # Default to EmailServer if type is not provided or invalid
  end
end
