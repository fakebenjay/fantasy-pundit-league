class CreateDefenses < ActiveRecord::Migration[5.1]
  def change
    create_table :defenses do |t|
      t.string :name
      t.string :search_name
      t.string :position
      t.string :status
      t.string :opp
      t.integer :week
      t.float :td
      t.float :int
      t.float :fr
      t.float :sck
      t.float :sfty
      t.float :blk
      t.float :pa
      t.float :points

      t.timestamps
    end
  end
end
