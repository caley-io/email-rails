class Action < ApplicationRecord
  belongs_to :user
  belongs_to :message

  has_one :email_thread, through: :message

  enum status: { todo: 0, in_progress: 1, done: 2 }
end
