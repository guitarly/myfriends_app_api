class AddColumnsUserFriendTable < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :email, :string
    add_column :users, :email, :string
  end
end
