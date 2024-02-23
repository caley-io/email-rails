class CreateEmailServers < ActiveRecord::Migration[7.2]
  def change
    create_table :email_servers do |t|
      t.string :name, null: false
      t.string :provider, null: false
      t.string :email, null: false
      t.string :imap_server, null: false
      t.integer :imap_port, null: false
      t.boolean :imap_ssl, null: false
      t.string :password
      t.references :user, null: false, foreign_key: true
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
