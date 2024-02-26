class Thread < ApplicationRecord
  # TODO: Categories
  belongs_to :email_server
  belongs_to :user

  has_many :messages
  has_many :actions, through: :messages

  enum urgency: { none: 0, low: 1, medium: 2, high: 3, urgent: 4 }
end
