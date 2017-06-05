class CreatePuzzleSets < ActiveRecord::Migration

  def self.up
    create_table :puzzle_sets do |t|
      t.string :theme
      t.timestamps null: false
    end
    execute "INSERT INTO puzzle_sets(theme, created_at, updated_at) select theme, created_at, updated_at FROM events"
    add_reference :events, :puzzle_set
    execute "UPDATE events SET puzzle_set_id = puzzle_sets.id FROM puzzle_sets WHERE events.theme = puzzle_sets.theme"
    remove_column :events, :theme
  end

  def self.down
    add_column :events, :theme, :string
    execute "UPDATE events SET theme = puzzle_sets.theme FROM puzzle_sets WHERE events.puzzle_set_id = puzzle_sets.id"
    remove_reference :events, :puzzle_set
    drop_table :puzzle_sets
  end
end
