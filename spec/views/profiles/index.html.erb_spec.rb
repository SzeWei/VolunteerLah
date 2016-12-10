require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
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
      ),
      Profile.create!(
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
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
