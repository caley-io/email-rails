class PagesController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @filters = [ "Inbox", "Reply later", "All" ]

    # TODO: This is a temporary solution to retrieve the last 20 emails
    # TODO: Add a user setting to toggle email servers
    @email_server = current_user.email_servers.first
    @email_threads = @email_server.email_threads.includes(:messages).last(20)
    # @emails = @email_server.retrieve_recent_emails if @email_server.present?
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
