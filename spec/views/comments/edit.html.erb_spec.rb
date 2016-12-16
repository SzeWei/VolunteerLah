require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :title => "MyString",
      :text => "MyText",
      :rating => 1,
      :user => nil,
      :event => nil
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_title[name=?]", "comment[title]"

      assert_select "textarea#comment_text[name=?]", "comment[text]"

      assert_select "input#comment_rating[name=?]", "comment[rating]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_event_id[name=?]", "comment[event_id]"
    end
  end
end
