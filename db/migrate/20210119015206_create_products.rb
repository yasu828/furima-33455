class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product,         null: false
      t.text :explain,           null: false
      t.integer :price,          null: false
      t.references :user,        foreign_key: true
      t.integer :category_id,    null: false
      t.integer :state_id,       null: false
      t.integer :shipping_id,    null: false
      t.integer :prefecture_id,  null: false
      t.integer :waitday_id,     null: false
      t.timestamps
    end
  end
end
