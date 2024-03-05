class Team < ApplicationRecord
  has_many :teams_users
  has_many :users, through: :teams_users
end

# == Schema Information
#
# Table name: teams
#
#  id           :bigint           not null, primary key
#  avatar_url   :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_teams_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
