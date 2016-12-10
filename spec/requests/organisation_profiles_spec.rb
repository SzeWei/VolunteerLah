require 'rails_helper'

RSpec.describe "OrganisationProfiles", type: :request do
  describe "GET /organisation_profiles" do
    it "works! (now write some real specs)" do
      get organisation_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
