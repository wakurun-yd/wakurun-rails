class CreateStickies < ActiveRecord::Migration
  def change
    create_table :stickies do |t|
      t.string :group
      t.string :comment
      t.string :author
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
