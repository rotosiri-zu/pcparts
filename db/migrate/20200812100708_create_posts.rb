class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :category_id
      t.timestamps
    end
  end
end
