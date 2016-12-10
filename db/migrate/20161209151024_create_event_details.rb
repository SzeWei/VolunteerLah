class CreateEventDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :event_details do |t|
      t.string :venue_title
      t.string :street_address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :contact_num
      t.belongs_to :event, foreign_key: true
      t.string :day_time
      t.float :longitude, null: false
      t.float :latitude, null: false

      t.timestamps null:false
    end
  end
end
