class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :type
      t.string :subtype
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :provider, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :accounts, :type
  end
end
