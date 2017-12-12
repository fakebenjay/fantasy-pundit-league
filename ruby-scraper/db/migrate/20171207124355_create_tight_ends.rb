class CreateTightEnds < ActiveRecord::Migration[5.1]
  def change
    create_table :tight_ends do |t|
      t.string :name
      t.string :search_name
      t.string :team
      t.string :position
      t.string :status
      t.string :opp
      t.integer :week
      t.string :comp_att
      t.float :pass_yds
      t.float :pass_td
      t.float :int
      t.float :rush_att
      t.float :rush_yds
      t.float :rush_td
      t.float :rec
      t.float :rec_yds
      t.float :rec_td
      t.float :tar
      t.float :two_pc
      t.float :fuml
      t.float :misc_td
      t.float :points

      t.timestamps
    end
  end
end
