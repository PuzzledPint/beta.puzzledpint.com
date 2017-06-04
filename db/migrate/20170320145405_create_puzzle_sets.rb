class CreatePuzzleSets < ActiveRecord::Migration

  def self.up
    create_table :puzzle_sets do |t|
      t.string :theme
      t.timestamps null: false
    end
    execute "INSERT INTO puzzle_sets(theme) VALUES select theme from event"
    add_reference :events, :puzzle_set
    execute "UPDATE events e, puzzle_sets ps SET e.puzzle_set_id = ps.id where e.theme = ps.theme"
    remove_column :events, :theme
  end

  def self.down
    add_column :events, :theme, :string
    execute "UPDATE events e, puzzle_sets ps SET e.theme = ps.theme where e.puzzle_set_id = e.id"
    remove_reference :events, :puzzle_set
    drop_table :puzzle_sets
  end
end
