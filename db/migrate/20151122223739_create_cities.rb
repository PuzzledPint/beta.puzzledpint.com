class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: true
      t.string :display_name, null: false
      t.string :state, null: true
      t.string :country, null: false
      t.references :parent, null: true
      t.timestamps null: false
    end

    add_index :cities, :parent_id
  end
end
