require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :description => "MyString",
      :category => 1,
      :user => "",
      :target_space => 1,
      :event_photos => "",
      :status => 1
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_description[name=?]", "event[description]"

      assert_select "input#event_category[name=?]", "event[category]"

      assert_select "input#event_user[name=?]", "event[user]"

      assert_select "input#event_target_space[name=?]", "event[target_space]"

      assert_select "input#event_event_photos[name=?]", "event[event_photos]"

      assert_select "input#event_status[name=?]", "event[status]"
    end
  end
end
