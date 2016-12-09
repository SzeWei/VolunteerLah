class CreateEventVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_volunteers do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null:false
    end
  end
end
