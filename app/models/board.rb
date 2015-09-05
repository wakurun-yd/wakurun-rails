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

  def select_stickies(group)
    stickies.select { |s| s.group == group.to_s }
  end
end
