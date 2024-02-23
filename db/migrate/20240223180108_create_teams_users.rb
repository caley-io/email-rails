class CreateTeamsUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :teams_users do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
