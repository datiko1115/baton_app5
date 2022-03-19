class CreateBuyerOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_orders do |t|
      t.references :admin_item,                null: false, foreign_key: true
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
