require 'rails_helper'

RSpec.describe "stickies/show", type: :view do
  before(:each) do
    @sticky = assign(:sticky, Sticky.create!(
      :type => "Type",
      :comment => "Comment",
      :author => "Author",
      :boards_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/1/)
  end
end
