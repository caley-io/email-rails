class EmailThread < ApplicationRecord
  # TODO: Categories
  belongs_to :email_server
  belongs_to :user

  has_many :messages
  has_many :actions, through: :messages

  enum urgency: {none: 0, low: 1, medium: 2, high: 3, urgent: 4}, _suffix: true
end

# == Schema Information
#
# Table name: email_threads
#
#  id               :bigint           not null, primary key
#  snippet          :string
#  summary          :string
#  urgency          :integer          default("none"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email_server_id  :bigint           not null
#  gmail_history_id :string
#  user_id          :bigint           not null
#
# Indexes
#
#  index_email_threads_on_email_server_id  (email_server_id)
#  index_email_threads_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (email_server_id => email_servers.id)
#  fk_rails_...  (user_id => users.id)
#
