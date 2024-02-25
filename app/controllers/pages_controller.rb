class PagesController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @filters = ["Inbox", "Reply later", "All"]

    # TODO: This is a temporary solution to retrieve the last email server
    @email_server = EmailServer.last
    @emails = @email_server.retrieve_recent_emails if @email_server.present?
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
