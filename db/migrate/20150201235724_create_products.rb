class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.datetime :released
      t.references :post

      t.timestamps
    end
    add_index :products, :post_id
  end
end
