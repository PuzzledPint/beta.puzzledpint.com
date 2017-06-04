class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :title
      t.references :puzzle_set, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
