class AddFullNameToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :full_name, :string, null: false
  end
end
