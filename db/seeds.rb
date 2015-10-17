# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require "csv"


CSV.foreach('db/user.tsv', :col_sep => "\t") do |row|
  User.create(:userId => row[0], :userCompany => row[1], :userDiscountRate => row[2])
end


CSV.foreach('db/item.tsv', :col_sep => "\t") do |row|
  Item.create(:itemId => row[0], :itemSupplier => row[1], :itemStockQuantity => row[2], :itemBasePrice => row[3], :itemTags => row[4])
end

CSV.foreach('db/order.tsv', :col_sep => "\t") do |row|
  Order.create(:orderId => row[0], :orderDateTime => row[1], :orderUserId => row[2], :orderItemId => row[3], :orderQuantity => row[4], :orderState => row[5], :orderTags => row[6])
end


