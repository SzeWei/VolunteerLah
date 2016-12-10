require 'rails_helper'

RSpec.describe "event_volunteers/show", type: :view do
  before(:each) do
    @event_volunteer = assign(:event_volunteer, EventVolunteer.create!(
      :user => nil,
      :event => nil,
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
