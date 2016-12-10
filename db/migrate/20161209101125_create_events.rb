class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :category, null: false
      t.belongs_to :user, foreign_key: true
      t.integer :target_space
      t.json :event_photos
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
