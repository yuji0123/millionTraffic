class Order < ActiveRecord::Base
	def to_builder
		Jbuilder.new do |order|
			order.(self, :orderId, :orderDateTime, :orderUserId, :orderItemId, :orderQuantity, :orderState)
		end

	end
end
