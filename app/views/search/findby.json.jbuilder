json.set! "result", @result
if @result then
	json.set! "data" do
		json.array! @orders do |order|
		    json.orderId order["orderId"]
		    json.orderDateTime order["orderDateTime"]
		    json.orderUserId order["orderUserId"]
		    json.orderItemId order["orderItemId"]
		    json.orderQuantity order["orderQuantity"]
		    json.orderState order["orderState"]
		    json.orderTags do
			    json.array! (order["orderTags"].split(','))
			end
		end
	end
end