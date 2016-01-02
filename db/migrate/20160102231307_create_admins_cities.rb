class CreateAdminsCities < ActiveRecord::Migration
  def change
    create_table :admins_cities do |t|
      t.belongs_to :admin
      t.belongs_to :city
    end

    add_index :admins_cities, [:admin_id, :city_id]
  end
end
