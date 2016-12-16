class AddColumnsToEventVolunteers < ActiveRecord::Migration[5.0]
  def change
  	add_column :event_volunteers, :name, :string
  	add_column :event_volunteers, :email, :string
  	add_column :event_volunteers, :phone, :string
  end
end