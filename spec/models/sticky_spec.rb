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
  pending "add some examples to (or delete) #{__FILE__}"
end
