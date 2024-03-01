class Message < ApplicationRecord
  # TODO: in_reply_to
  belongs_to :email_server
  belongs_to :email_thread
  belongs_to :user

  has_many :actions

  enum urgency: {none: 0, low: 1, medium: 2, high: 3, urgent: 4}
end
