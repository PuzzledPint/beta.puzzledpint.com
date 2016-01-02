class AddBarUrlToEventLocations < ActiveRecord::Migration
  def up
    change_table :event_locations, bulk: true  do |t|
      t.string :bar_url
      t.remove :start_time
      t.time :start_time, default: '18:00:00'
    end
  end

  def down
    change_table :event_locations, bulk: true  do |t|
      t.remove :bar_url
      t.remove :start_time
      t.string :start_time, default: '6:00'
    end
  end
end
