class AddImapFieldsToAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column :accounts, :imap_server, :string
    add_column :accounts, :imap_port, :integer
    add_column :accounts, :imap_ssl, :boolean
    add_column :accounts, :password, :string
  end
end
