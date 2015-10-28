# == Schema Information
#
# Table name: stickies
#
#  id         :integer          not null, primary key
#  group      :string
#  comment    :string
#  author     :string
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Sticky, type: :model do

  before { @sticky = Sticky.new(group: "Keep", comment: "Example comment",
                                author: "example author", board_id: 1) }

  subject { @sticky }

  it { should respond_to(:group) }
  it { should respond_to(:comment) }
  it { should respond_to(:author) }
  it { should respond_to(:board_id) }

  it { should be_valid }

  describe "when comment is not present" do
    before { @sticky.comment = " " }
    it { should_not be_valid }
  end

  describe "when author is not present" do
    before { @sticky.author = " " }
    it { should_not be_valid }
  end
end
