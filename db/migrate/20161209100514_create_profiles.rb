class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name, default: "New Member"
      t.text :skills
      t.text :description
      t.string :gender
      t.string :phone
      t.text :street_address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :country, default: "Malaysia"
      t.date :birthdate
      t.string :contact_email
      t.string :language
      t.text :work
      t.text :education
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
