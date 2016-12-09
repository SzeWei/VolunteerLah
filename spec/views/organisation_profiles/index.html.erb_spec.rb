require 'rails_helper'

RSpec.describe "organisation_profiles/index", type: :view do
  before(:each) do
    assign(:organisation_profiles, [
      OrganisationProfile.create!(
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
      ),
      OrganisationProfile.create!(
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
      )
    ])
  end

  it "renders a list of organisation_profiles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Field Or Industry".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
