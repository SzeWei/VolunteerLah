require 'rails_helper'

RSpec.describe "event_details/index", type: :view do
  before(:each) do
    assign(:event_details, [
      EventDetail.create!(
        :venue_title => "Venue Title",
        :street_address => "Street Address",
        :postal_code => "Postal Code",
        :city => "City",
        :state => "State",
        :contact_num => "Contact Num",
        :event => nil,
        :day_time => "Day Time",
        :longitude => 2.5,
        :latitude => 3.5
      ),
      EventDetail.create!(
        :venue_title => "Venue Title",
        :street_address => "Street Address",
        :postal_code => "Postal Code",
        :city => "City",
        :state => "State",
        :contact_num => "Contact Num",
        :event => nil,
        :day_time => "Day Time",
        :longitude => 2.5,
        :latitude => 3.5
      )
    ])
  end

  it "renders a list of event_details" do
    render
    assert_select "tr>td", :text => "Venue Title".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Num".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Day Time".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
