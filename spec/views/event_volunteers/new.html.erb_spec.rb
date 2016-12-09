require 'rails_helper'

RSpec.describe "event_volunteers/new", type: :view do
  before(:each) do
    assign(:event_volunteer, EventVolunteer.new(
      :user => nil,
      :event => nil,
      :status => 1
    ))
  end

  it "renders new event_volunteer form" do
    render

    assert_select "form[action=?][method=?]", event_volunteers_path, "post" do

      assert_select "input#event_volunteer_user_id[name=?]", "event_volunteer[user_id]"

      assert_select "input#event_volunteer_event_id[name=?]", "event_volunteer[event_id]"

      assert_select "input#event_volunteer_status[name=?]", "event_volunteer[status]"
    end
  end
end
