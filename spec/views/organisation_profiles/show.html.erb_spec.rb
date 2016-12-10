require 'rails_helper'

RSpec.describe "organisation_profiles/show", type: :view do
  before(:each) do
    @organisation_profile = assign(:organisation_profile, OrganisationProfile.create!(
      :name => "Name",
      :field_or_industry => "Field Or Industry",
      :website => "Website",
      :org_description => "MyText",
      :org_size => 2,
      :language => "Language",
      :phone => "Phone",
      :fax => "Fax",
      :email => "Email",
      :contact_person => "Contact Person",
      :address => "MyText",
      :postal_code => "Postal Code",
      :city => "City",
      :state => "State",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Field Or Industry/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Contact Person/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(//)
  end
end
