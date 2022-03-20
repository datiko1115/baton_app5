class AddAdminItemIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :admin_item, null: false, foreign_key: true
  end
end
