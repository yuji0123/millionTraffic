class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemId
      t.text :itemSupplier
      t.integer :itemStockQuantity
      t.integer :itemBasePrice
      t.text :itemTags

      t.timestamps null: false
    end
  end
end
