class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state, null: true
      t.string :country, null: false
      t.references :parent, null: true
      t.timestamps null: false
    end
  end
end
