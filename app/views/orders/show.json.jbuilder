json.set! "result", @result
if @result == "true" then
	json.set! "data" do
	    json.orderId @order.orderId
	    json.orderDateTime @order.orderDateTime
	    json.orderUserId @order.orderUserId
	    json.orderItemId @order.orderItemId
	    json.orderQuantity @order.orderQuantity
	    json.orderState @order.orderState
	    json.tags @order.orderTags
	end
else
	json.set! "data", "null"
end