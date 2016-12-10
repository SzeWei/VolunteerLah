require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :skills => "MyText",
      :description => "MyText",
      :gender => "Gender",
      :phone => "Phone",
      :street_address => "MyText",
      :postal_code => "Postal Code",
      :city => "City",
      :state => "State",
      :country => "Country",
      :contact_email => "",
      :language => "Language",
      :work => "MyText",
      :education => "",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
