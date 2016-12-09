class TransferNameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string, default: "New Member"
  	remove_column :profiles, :name
  end
end
