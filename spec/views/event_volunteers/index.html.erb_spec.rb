require 'rails_helper'

RSpec.describe "event_volunteers/index", type: :view do
  before(:each) do
    assign(:event_volunteers, [
      EventVolunteer.create!(
        :user => nil,
        :event => nil,
        :status => 2
      ),
      EventVolunteer.create!(
        :user => nil,
        :event => nil,
        :status => 2
      )
    ])
  end

  it "renders a list of event_volunteers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
