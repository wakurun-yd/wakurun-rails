require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(title: "Example board 1"),
      Board.create!(title: "Example board 2")
    ])
  end

  it "renders a list of boards" do
    render
  end
end
