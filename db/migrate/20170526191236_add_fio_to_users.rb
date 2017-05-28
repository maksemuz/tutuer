class AddFioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_firstname, :string
    add_column :users, :user_family, :string
  end
end
