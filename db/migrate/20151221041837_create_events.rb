class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_at, null: false
      t.string :theme, null: false

      t.timestamps null: false
    end
  end
end
