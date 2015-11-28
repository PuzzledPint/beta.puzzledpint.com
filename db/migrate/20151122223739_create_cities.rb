class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :display_name, null: false
      t.string :city, null: false
      t.string :state, null: true
      t.string :country, null: false
      t.references :parent
      t.timestamps null: false
    end
  end
end
