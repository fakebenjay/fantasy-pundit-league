class CreateKickers < ActiveRecord::Migration[5.1]
  def change
    create_table :kickers do |t|
      t.string :name
      t.string :search_name
      t.string :team
      t.string :position
      t.string :status
      t.string :opp
      t.integer :week
      t.string :thirty
      t.string :forty
      t.string :fifty
      t.string :fg
      t.string :xp
      t.float :points

      t.timestamps
    end
  end
end
