require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :title => "Title",
        :text => "MyText",
        :rating => 2,
        :user => nil,
        :event => nil
      ),
      Comment.create!(
        :title => "Title",
        :text => "MyText",
        :rating => 2,
        :user => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
