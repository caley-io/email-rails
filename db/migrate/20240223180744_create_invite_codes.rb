class CreateInviteCodes < ActiveRecord::Migration[7.2]
  def change
    create_table :invite_codes do |t|
      t.string :token

      t.timestamps
    end

    add_index :invite_codes, :token, unique: true
  end
end
