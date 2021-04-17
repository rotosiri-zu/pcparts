class CreateRakutens < ActiveRecord::Migration[5.2]
  def change
    create_table :rakutens do |t|
      t.string :item_name
      t.integer :item_price
      t.bigint :item_code
      t.string :item_url
      t.string :image_url
      t.string :genle_id
      t.text :item_caption
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
