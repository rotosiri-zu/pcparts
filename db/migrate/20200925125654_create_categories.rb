class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name,     null: false
      t.timestamps
    end
    # ActiveRecord::Base.connection.execute("SELECT setval('addresses_id_seq', coalesce((SELECT MAX(id)+1 FROM addresses), 1), false)")
  end
end
