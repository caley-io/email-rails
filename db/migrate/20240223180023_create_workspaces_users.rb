class CreateWorkspacesUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :workspaces_users do |t|
      t.references :workspace, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
