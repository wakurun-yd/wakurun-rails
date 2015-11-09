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

  let(:board) { FactoryGirl.create :board }

  subject { board }

  it { should respond_to(:title) }

  it { should be_valid }

  describe "when title is not present" do
    before { board.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { board.title = "a" * 21 }
    it { should_not be_valid }
  end

  describe "select stickies by group" do
    before { board.save }
    let!(:keep_sticky1) do
      FactoryGirl.create(:sticky, board: board, group: "Keep")
    end
    let!(:keep_sticky2) do
      FactoryGirl.create(:sticky, board: board, group: "Keep")
    end
    let!(:try_sticky) do
      FactoryGirl.create(:sticky, board: board, group: "Try")
    end

    it "should include stickies in the group" do
      expect(board.select_stickies("Keep").to_a).to include keep_sticky1, keep_sticky2
    end
    it "should not include stickies not in the group" do
      expect(board.select_stickies("Keep").to_a).not_to include try_sticky
    end
  end

  describe "select stickies by group in order" do
    before { board.save }
    let!(:like0_new_sticky) do
      FactoryGirl.create(:sticky, board: board, like: 0, created_at: 1.hour.ago)
    end
    let!(:like0_old_sticky) do
      FactoryGirl.create(:sticky, board: board, like: 0, created_at: 1.day.ago)
    end
    let!(:like3_new_sticky) do
      FactoryGirl.create(:sticky, board: board, like: 3, created_at: 1.hour.ago)
    end

    it "should have the right stickies in the right order" do
      expect(board.select_stickies("Keep").to_a).to eq [like3_new_sticky, like0_old_sticky, like0_new_sticky]
    end
  end
end
