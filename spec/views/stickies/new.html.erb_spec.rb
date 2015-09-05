require 'rails_helper'

RSpec.describe "stickies/new", type: :view do
  before(:each) do
    assign(:sticky, Sticky.new(
      :type => "",
      :comment => "MyString",
      :author => "MyString",
      :boards_id => 1
    ))
  end

  it "renders new sticky form" do
    render

    assert_select "form[action=?][method=?]", stickies_path, "post" do

      assert_select "input#sticky_type[name=?]", "sticky[type]"

      assert_select "input#sticky_comment[name=?]", "sticky[comment]"

      assert_select "input#sticky_author[name=?]", "sticky[author]"

      assert_select "input#sticky_boards_id[name=?]", "sticky[boards_id]"
    end
  end
end
