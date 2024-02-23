class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :avatar_url
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
