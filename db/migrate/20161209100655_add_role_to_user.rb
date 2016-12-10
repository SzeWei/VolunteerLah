class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :role, :integer, default: 2
  	add_column :users, :username, :string
  end
end
