class Message < ApplicationRecord
  # TODO: in_reply_to
  belongs_to :email_server
  belongs_to :email_thread
  belongs_to :user

  has_many :actions

  enum urgency: {none: 0, low: 1, medium: 2, high: 3, urgent: 4}, _suffix: true
end

# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :string
#  from            :string           not null
#  in_reply_to     :integer
#  sender_name     :string
#  snippet         :string
#  subject         :string
#  summary         :string
#  to              :string           not null
#  urgency         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email_server_id :bigint           not null
#  email_thread_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_messages_on_email_server_id  (email_server_id)
#  index_messages_on_email_thread_id  (email_thread_id)
#  index_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (email_server_id => email_servers.id)
#  fk_rails_...  (email_thread_id => email_threads.id)
#  fk_rails_...  (user_id => users.id)
#
