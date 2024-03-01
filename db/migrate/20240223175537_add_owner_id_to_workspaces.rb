class AddOwnerIdToWorkspaces < ActiveRecord::Migration[7.2]
  def change
    add_reference :workspaces, :owner, null: false, foreign_key: {to_table: :users}
  end
end
