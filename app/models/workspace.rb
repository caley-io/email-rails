class Workspace < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", optional: true
  has_many :workspaces_users
  has_many :users, through: :workspaces_users
end

# == Schema Information
#
# Table name: workspaces
#
#  id         :bigint           not null, primary key
#  avatar_url :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_workspaces_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
