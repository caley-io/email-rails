class WorkspacesUser < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
end

# == Schema Information
#
# Table name: workspaces_users
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_workspaces_users_on_user_id       (user_id)
#  index_workspaces_users_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
