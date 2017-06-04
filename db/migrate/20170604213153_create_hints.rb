class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :note
      t.string :text

      t.references :puzzle, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
