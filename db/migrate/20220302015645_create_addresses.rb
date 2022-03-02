class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string :postcode,               null: false
      t.integer :prefecture_id,         null: false
      t.address :string,                null: false
      t.string :building,               null: false
      t.string :phone,                  null: false
      t.order :references,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
