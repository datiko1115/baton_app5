class CreateAdminItems < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_items do |t|
      t.string :admin_item_name,                null: false
      t.text :admin_description,                null: false
      t.integer :category_id,                   null: false
      t.integer :proper_price,                  null: false
      t.integer :price,                         null: false
      t.references :admin,                      null: false, foreign_key: true

      t.timestamps
    end
  end
end
