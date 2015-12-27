class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :bar_name, null: true
      t.string :start_time, length: 8, null: true, default: '6:00'
      t.text :notes, null: true
      t.string :addr_street_1, null: true
      t.string :addr_street_2, null: true
      t.string :addr_city, null: true
      t.string :addr_state, null: true
      t.string :addr_postal_code, null: true
      t.string :addr_country, null: true
      t.references :city, null: false
      t.references :event, null: false
      t.timestamps null: false
    end

    add_index :event_locations, :city_id
    add_index :event_locations, :event_id
  end
end
