class SearchController < ApplicationController
	def findby

		@orders = Order.all

		if params[:findByOrderDateTimeGTE] != nil then
			# @orders = Order.find_by_sql(['select * from orders where orderDateTime >= ? order by orderDateTime desc limit ?', params[:findByOrderDateTimeGTE].to_i, params[:limit].to_i])
			@orders = @orders.where('orderDateTime >= ?', params[:findByOrderDateTimeGTE].to_i).order('orderDateTime desc')
		end
		if params[:findByOrderDateTimeLTE] != nil then
			@orders = @orders.where('orderDateTime <= ?', params[:findByOrderDateTimeLTE].to_i).order('orderDateTime desc')
		end
		if params[:findByOrderUserId] != nil then
			@orders = @orders.where(orderUserId: params[:findByOrderUserId])
		end
		if params[:findByOrderItemId] != nil then
			@orders = @orders.where(orderItemId: params[:findByOrderItemId])
		end
		if params[:findByOrderQuantityGTE] != nil then
			@orders = @orders.where('orderQuantity >= ?', params[:findByOrderQuantityGTE].to_i).order('orderDateTime desc')
		end
		if params[:findByOrderQuantityLTE] != nil then
			@orders = @orders.where('orderQuantity <= ?', params[:findByOrderQuantityLTE].to_i).order('orderDateTime desc')
		end
		if params[:findByOrderState] != nil then
			@orders = @orders.where(orderState: params[:findByOrderState])
		end

		if params[:findByOrderTagsIncludeAll] != nil then
			tags = params[:findByOrderTagsIncludeAll].split(",")
			tags.each{|tag|
				@orders = @orders.where("orderTags like '%" + tag + "%'")
			}
		end

		if params[:findByOrderTagsIncludeAny] != nil then
			scopes = Array.new
			tags = params[:findByOrderTagsIncludeAny].split(",")
			tags.each{|tag|
				scopes.push(@orders.where("orderTags like '%" + tag + "%'"))
			}

		end

		if params[:findByUserCompany] != nil then
			users = User.where(userCompany: params[:userCompany])
			userId = users.arel_table[:userId]
			@orders = @orders.where(orderUserId: userId).order('orderDateTime desc').limit(params[:limit].to_i)
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
		if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
		end


    	  @result = true
	      render status: :ok
	end
end