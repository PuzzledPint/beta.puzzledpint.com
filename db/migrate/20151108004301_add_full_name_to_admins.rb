class AddFullNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :full_name, :string, null: false
  end
end
