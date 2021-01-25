class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcode,     null: false
      t.integer :prefecture_id, null: false
      t.string :addtwo,         null: false
      t.string :addthree,       null: false
      t.string :building,       null: false
      t.string :tel,            null: false
      t.references :buydata,    foreign_key: true
      t.timestamps
    end
  end
end
