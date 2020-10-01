class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name,     null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :categories, :ancestry
    ActiveRecord::Base.connection.execute("SELECT setval('categories_id_seq', coalesce((SELECT MAX(id)+1 FROM users), 1), false)")
  end
end
