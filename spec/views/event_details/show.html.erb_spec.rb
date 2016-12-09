require 'rails_helper'

RSpec.describe "event_details/show", type: :view do
  before(:each) do
    @event_detail = assign(:event_detail, EventDetail.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Venue Title/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Contact Num/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Day Time/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
