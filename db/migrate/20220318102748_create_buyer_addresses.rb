class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string :postcode,               null: false
      t.integer :prefecture_id,         null: false
      t.string :city,                null: false      
      t.string :address,                null: false
      t.string :building
      t.string :phone,                  null: false
      t.references :buyer_order,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
