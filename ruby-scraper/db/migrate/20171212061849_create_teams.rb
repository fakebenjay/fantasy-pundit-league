class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :search_name
      t.integer :week
      t.string :quality
      t.string :qb_name
      t.float :qb_points
      t.string :rb1_name
      t.float :rb1_points
      t.string :rb2_name
      t.float :rb2_points
      t.string :wr1_name
      t.float :wr1_points
      t.string :wr2_name
      t.float :wr2_points
      t.string :te_name
      t.float :te_points
      t.string :flex_name
      t.float :flex_points
      t.string :dst_name
      t.float :dst_points
      t.string :k_name
      t.float :k_points
      t.float :total_points

      t.timestamps
    end
  end
end
