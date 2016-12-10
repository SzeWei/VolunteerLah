require 'rails_helper'

RSpec.describe "EventDetails", type: :request do
  describe "GET /event_details" do
    it "works! (now write some real specs)" do
      get event_details_path
      expect(response).to have_http_status(200)
    end
  end
end
