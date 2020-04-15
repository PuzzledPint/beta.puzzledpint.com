class AddAdminRole < ActiveRecord::Migration[5.2]
  def up
    Role.create!([{ name: 'admin' }, { name: 'location_gc' }])
  end

  def down
    Role.where(name: 'admin').destroy
  end
end
