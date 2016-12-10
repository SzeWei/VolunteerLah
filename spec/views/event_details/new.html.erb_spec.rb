require 'rails_helper'

RSpec.describe "event_details/new", type: :view do
  before(:each) do
    assign(:event_detail, EventDetail.new(
      :venue_title => "MyString",
      :street_address => "MyString",
      :postal_code => "MyString",
      :city => "MyString",
      :state => "MyString",
      :contact_num => "MyString",
      :event => nil,
      :day_time => "MyString",
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders new event_detail form" do
    render

    assert_select "form[action=?][method=?]", event_details_path, "post" do

      assert_select "input#event_detail_venue_title[name=?]", "event_detail[venue_title]"

      assert_select "input#event_detail_street_address[name=?]", "event_detail[street_address]"

      assert_select "input#event_detail_postal_code[name=?]", "event_detail[postal_code]"

      assert_select "input#event_detail_city[name=?]", "event_detail[city]"

      assert_select "input#event_detail_state[name=?]", "event_detail[state]"

      assert_select "input#event_detail_contact_num[name=?]", "event_detail[contact_num]"

      assert_select "input#event_detail_event_id[name=?]", "event_detail[event_id]"

      assert_select "input#event_detail_day_time[name=?]", "event_detail[day_time]"

      assert_select "input#event_detail_longitude[name=?]", "event_detail[longitude]"

      assert_select "input#event_detail_latitude[name=?]", "event_detail[latitude]"
    end
  end
end
