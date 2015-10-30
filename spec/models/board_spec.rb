# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Board, type: :model do

  before { @board = Board.new(title: "Example board") }

  subject { @board }

  it { should respond_to(:title) }

  it { should be_valid }

  describe "when title is not present" do
    before { @board.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @board.title = "a" * 21 }
    it { should_not be_valid }
  end
end
