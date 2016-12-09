class CreateOrganisationProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :organisation_profiles do |t|
      t.string :name
      t.string :field_or_industry
      t.string :website
      t.text :org_description
      t.integer :org_size
      t.string :language
      t.string :phone
      t.string :fax
      t.string :email
      t.string :contact_person
      t.text :address
      t.string :postal_code
      t.string :city
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
