class OrganisationProfile < ApplicationRecord
  belongs_to :user
  # When they sign up, they will not be able to fill up these things, so
  # I had change them to on_update for now
  validates :name, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :state, presence: true, on: :update
  validates :phone, presence: true, on: :update
  mount_uploaders :org_photos, OrgPhotosUploader
end
