class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :search_name
      t.integer :week
      t.string :qb_name
      t.float :qb_score
      t.string :rb1_name
      t.float :rb1_score
      t.string :rb2_name
      t.float :rb2_score
      t.string :wr1_name
      t.float :wr1_score
      t.string :wr2_name
      t.float :wr2_score
      t.string :te_name
      t.float :te_score
      t.string :flex_name
      t.float :flex_score
      t.string :dst_name
      t.float :dst_score
      t.string :k_name
      t.float :k_score
      t.float :total_points

      t.timestamps
    end
  end
end
