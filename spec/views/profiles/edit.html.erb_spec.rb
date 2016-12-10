require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :skills => "MyText",
      :description => "MyText",
      :gender => "MyString",
      :phone => "MyString",
      :street_address => "MyText",
      :postal_code => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :contact_email => "",
      :language => "MyString",
      :work => "MyText",
      :education => "",
      :user => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "textarea#profile_skills[name=?]", "profile[skills]"

      assert_select "textarea#profile_description[name=?]", "profile[description]"

      assert_select "input#profile_gender[name=?]", "profile[gender]"

      assert_select "input#profile_phone[name=?]", "profile[phone]"

      assert_select "textarea#profile_street_address[name=?]", "profile[street_address]"

      assert_select "input#profile_postal_code[name=?]", "profile[postal_code]"

      assert_select "input#profile_city[name=?]", "profile[city]"

      assert_select "input#profile_state[name=?]", "profile[state]"

      assert_select "input#profile_country[name=?]", "profile[country]"

      assert_select "input#profile_contact_email[name=?]", "profile[contact_email]"

      assert_select "input#profile_language[name=?]", "profile[language]"

      assert_select "textarea#profile_work[name=?]", "profile[work]"

      assert_select "input#profile_education[name=?]", "profile[education]"

      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
    end
  end
end
