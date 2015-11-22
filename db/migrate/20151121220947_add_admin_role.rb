class AddAdminRole < ActiveRecord::Migration
  def up
    Role.create!([{ name: 'admin' }, { name: 'location_gc' }])
  end

  def down
    Role.where(name: 'admin').destroy
  end
end
