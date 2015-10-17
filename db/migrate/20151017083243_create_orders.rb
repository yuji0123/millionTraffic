class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :orderId
      t.string :orderDateTime
      t.string :orderUserId
      t.string :orderItemId
      t.integer :orderQuantity
      t.text :orderState
      t.text :orderTags

      t.timestamps null: false
    end
  end
end
