require "rails_helper"

RSpec.describe OrganisationProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/organisation_profiles").to route_to("organisation_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/organisation_profiles/new").to route_to("organisation_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/organisation_profiles/1").to route_to("organisation_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/organisation_profiles/1/edit").to route_to("organisation_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organisation_profiles").to route_to("organisation_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/organisation_profiles/1").to route_to("organisation_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organisation_profiles/1").to route_to("organisation_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organisation_profiles/1").to route_to("organisation_profiles#destroy", :id => "1")
    end

  end
end
