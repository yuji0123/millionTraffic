class SearchController < ApplicationController
	def findby
		if params[:findByOrderDateTimeGTE] != nil then
			@orders = Order.find_by_sql(['select * from orders where orderDateTime >= ? order by orderDateTime desc limit ?', params[:findByOrderDateTimeGTE].to_i, params[:limit].to_i])
			# @orders = Order.where('orderDateTime >= ?', params[:findByOrderDateTimeGTE].to_i).order('orderDateTime desc')
			# if params[:limit] != nil then
			# 	@orders = @orders.limit(params[:limit].to_i)
			# else
			# 	@orders = @orders.limit(100)
			# end
		end
		if params[:findByOrderDateTimeLTE] != nil then
			@orders = Order.where('orderDateTime <= ?', params[:findByOrderDateTimeLTE].to_i).order('orderDateTime desc')
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end
		if params[:findByOrderUserId] != nil then
			@orders = Order.where(orderUserId: params[:findByOrderUserId])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end
		if params[:findByOrderItemId] != nil then
			@orders = Order.where(orderItemId: params[:findByOrderItemId])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end
		if params[:findByOrderQuantityGTE] != nil then
			@orders = Order.where('orderQuantity >= ?', params[:findByOrderQuantityGTE].to_i).order('orderDateTime desc')
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end
		if params[:findByOrderQuantityLTE] != nil then
			@orders = Order.where('orderQuantity <= ?', params[:findByOrderQuantityLTE].to_i).order('orderDateTime desc')
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end
		if params[:findByOrderState] != nil then
			@orders = Order.where(orderState: params[:findByOrderState])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			else
				@orders = @orders.limit(100)
			end
		end

		if params[:findByOrderTagsIncludeAll] != nil then
			@orders = Order.all
			tags = params[:findByOrderTagsIncludeAll].split(",")
			tags.each{|tag|
				@orders = @orders.where("orderTags like '%" + tag + "%'")
			}
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i).order('orderDateTime desc')
			else
				@orders = @orders.limit(100).order('orderDateTime asc')
			end
		end

		if params[:findByOrderTagsIncludeAny] != nil then
			@orders = Order.all
			tags = params[:findByOrderTagsIncludeAny].split(",")
			tags.each{|tag|
				@orders = @orders.where("orderTags not like '%" + tag + "%'")
			}
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i).order('orderDateTime desc')
			else
				@orders = @orders.limit(100).order('orderDateTime desc')
			end
		end

		if params[:findByUserCompany] != nil then
			users = User.where(userCompany: params[:userCompany])
			userId = users.arel_table[:userId]
			@orders = Order.where(orderUserId: userId).order('orderDateTime desc').limit(params[:limit].to_i)
		end

		if params[:findByUserDiscountRageGTE] != nil then
			users = User.where('userDiscountRate >= ?', params[:userDiscountRate])
			users.each{|user|
				userId = user.arel_table[:userId]
			}
			@orders = Order.where(orderUserId: user.userId).order('orderDateTime desc').limit(params[:limit])
		end

		if params[:findByUserDiscountRageGTE] != nil then
			user = User.where('userDiscountRate <= ?', params[:userDiscountRate])
			@orders = Order.where(orderUserId: user.userId).order('orderDateTime desc').limit(params[:limit])
		end



		# if @orders != nil then
		# 	@orders.each{|order|
		# 		order.orderTags = order.orderTags.split(',')
		# 	}
		# end
    	  @result = true
	      render status: :ok
	end
end