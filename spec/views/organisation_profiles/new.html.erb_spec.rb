require 'rails_helper'

RSpec.describe "organisation_profiles/new", type: :view do
  before(:each) do
    assign(:organisation_profile, OrganisationProfile.new(
      :name => "MyString",
      :field_or_industry => "MyString",
      :website => "MyString",
      :org_description => "MyText",
      :org_size => 1,
      :language => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :contact_person => "MyString",
      :address => "MyText",
      :postal_code => "MyString",
      :city => "MyString",
      :state => "MyString",
      :user => nil
    ))
  end

  it "renders new organisation_profile form" do
    render

    assert_select "form[action=?][method=?]", organisation_profiles_path, "post" do

      assert_select "input#organisation_profile_name[name=?]", "organisation_profile[name]"

      assert_select "input#organisation_profile_field_or_industry[name=?]", "organisation_profile[field_or_industry]"

      assert_select "input#organisation_profile_website[name=?]", "organisation_profile[website]"

      assert_select "textarea#organisation_profile_org_description[name=?]", "organisation_profile[org_description]"

      assert_select "input#organisation_profile_org_size[name=?]", "organisation_profile[org_size]"

      assert_select "input#organisation_profile_language[name=?]", "organisation_profile[language]"

      assert_select "input#organisation_profile_phone[name=?]", "organisation_profile[phone]"

      assert_select "input#organisation_profile_fax[name=?]", "organisation_profile[fax]"

      assert_select "input#organisation_profile_email[name=?]", "organisation_profile[email]"

      assert_select "input#organisation_profile_contact_person[name=?]", "organisation_profile[contact_person]"

      assert_select "textarea#organisation_profile_address[name=?]", "organisation_profile[address]"

      assert_select "input#organisation_profile_postal_code[name=?]", "organisation_profile[postal_code]"

      assert_select "input#organisation_profile_city[name=?]", "organisation_profile[city]"

      assert_select "input#organisation_profile_state[name=?]", "organisation_profile[state]"

      assert_select "input#organisation_profile_user_id[name=?]", "organisation_profile[user_id]"
    end
  end
end
