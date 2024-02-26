class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :thread, null: false, foreign_key: true
      t.references :email_server, null: false, foreign_key: true
      t.string :sender_name
      t.string :from, null: false
      t.string :to, null: false
      t.string :subject
      t.string :snippet
      t.string :body
      t.string :summary
      t.integer :urgency
      t.integer :in_reply_to

      t.timestamps
    end
  end
end
