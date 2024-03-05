class TeamsUser < ApplicationRecord
  belongs_to :team
  belongs_to :user
end

# == Schema Information
#
# Table name: teams_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_teams_users_on_team_id  (team_id)
#  index_teams_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
