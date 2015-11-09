# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ActiveRecord::Base
  has_many :stickies, dependent: :destroy
  validates :title, presence: true, length: { maximum: 20 }

  def select_stickies(group)
    stickies.order(like: :desc, created_at: :asc).select { |s| s.group == group.to_s }
  end
end
