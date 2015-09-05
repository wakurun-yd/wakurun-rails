require 'rails_helper'

RSpec.describe "stickies/index", type: :view do
  before(:each) do
    assign(:stickies, [
      Sticky.create!(
        :type => "Type",
        :comment => "Comment",
        :author => "Author",
        :boards_id => 1
      ),
      Sticky.create!(
        :type => "Type",
        :comment => "Comment",
        :author => "Author",
        :boards_id => 1
      )
    ])
  end

  it "renders a list of stickies" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
