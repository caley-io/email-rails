class PagesController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @account = Current.team.accounts.last
    @emails = @account.retrieve_recent_emails if @account.present?
  end

  def done
  end

  def team
  end

  def calendar
  end

  def vip
  end

  def sent
  end

  def later
  end

  def draft
  end

  def archive
  end

  def trash
  end
end
