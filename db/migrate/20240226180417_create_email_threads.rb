class CreateEmailThreads < ActiveRecord::Migration[7.2]
  def change
    create_table :email_threads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :email_server, null: false, foreign_key: true
      t.string :gmail_history_id
      t.string :snippet
      t.string :summary
      t.integer :urgency, null: false, default: 0

      t.timestamps
    end
  end
end
