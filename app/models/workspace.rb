class Workspace < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", optional: true
  has_many :workspaces_users
  has_many :users, through: :workspaces_users
end
