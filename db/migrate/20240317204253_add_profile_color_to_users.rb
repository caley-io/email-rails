class AddProfileColorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_color, :string
  end
end
