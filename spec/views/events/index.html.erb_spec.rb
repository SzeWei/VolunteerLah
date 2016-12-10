require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :description => "Description",
        :category => 2,
        :user => "",
        :target_space => 3,
        :event_photos => "",
        :status => 4
      ),
      Event.create!(
        :title => "Title",
        :description => "Description",
        :category => 2,
        :user => "",
        :target_space => 3,
        :event_photos => "",
        :status => 4
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
