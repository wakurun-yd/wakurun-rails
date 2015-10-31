class AddLikeToStickies < ActiveRecord::Migration
  def change
    add_column :stickies, :like, :integer
  end
end
