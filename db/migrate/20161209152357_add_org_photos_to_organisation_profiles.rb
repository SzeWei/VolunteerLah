class AddOrgPhotosToOrganisationProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :organisation_profiles, :org_photos, :json
  end
end
