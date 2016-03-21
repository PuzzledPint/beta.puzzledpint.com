class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :body, null: false
      t.integer :parent_id, null: true
      t.boolean :active, null: false, default: false

      t.timestamps null: false
    end

    add_index :pages, :slug
  end
end
