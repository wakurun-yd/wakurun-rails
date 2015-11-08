class AddLikeToStickies < ActiveRecord::Migration
  def change
    add_column :stickies, :like, :integer, null: false, default: 0
  end
end
