class Action < ApplicationRecord
  belongs_to :user
  belongs_to :message

  has_one :email_thread, through: :message

  enum status: { todo: 0, in_progress: 1, done: 2 }
end

# == Schema Information
#
# Table name: actions
#
#  id          :bigint           not null, primary key
#  description :string
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  message_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_actions_on_message_id  (message_id)
#  index_actions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
