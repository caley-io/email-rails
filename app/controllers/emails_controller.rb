class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_filters
  layout "email", only: [ :new, :show ]
  def inbox
    # TODO: This is a temporary solution to retrieve the last 20 emails
    # TODO: Add a user setting to toggle email servers
    @email_server = current_user.email_servers.first
    @email_threads = @email_server.email_threads.includes(:messages).last(20)
  end

  def reply_later
    # TODO: To be implemented later
  end

  def all
    # TODO: To be implemented later
  end

  private

  def initialize_filters
    @filters = ["Inbox", "Reply later", "All"]
  end
end
