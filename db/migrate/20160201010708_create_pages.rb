class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :full_path, null: false
      t.text :content, null: false
      t.integer :parent_id, null: true
      t.boolean :active, null: false, default: false

      t.timestamps null: false
    end

    add_index :pages, :slug
    add_index :pages, :full_path, unique: true
    add_index :pages, :parent_id
  end
end
