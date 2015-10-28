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

class Sticky < ActiveRecord::Base
  belongs_to :board
  validates(:comment, presence: true)
  validates(:author, presence: true)
end
