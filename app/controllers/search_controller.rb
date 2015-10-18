class SearchController < ApplicationController
	def findby
		if params[:findByOrderDateTimeGTE] != nil then
			@orders = Order.where('orderDateTime >= ?', params[:findByOrderDateTimeGTE].to_i).order('orderDateTime asc').limit(100)
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderDateTimeLTE] != nil then
			@orders = Order.where('orderDateTime <= ?', params[:findByOrderDateTimeLTE].to_i).order('orderDateTime asc').limit(100)
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderUserId] != nil then
			@orders = Order.where(orderUserId: params[:findByOrderUserId])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderItemId] != nil then
			@orders = Order.where(orderItemId: params[:findByOrderItemId])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderQuantityGTE] != nil then
			@orders = Order.where('orderQuantity >= ?', params[:findByOrderQuantityGTE].to_i).order('orderDateTime asc').limit(100)
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderQuantityLTE] != nil then
			@orders = Order.where('orderQuantity <= ?', params[:findByOrderQuantityLTE].to_i).order('orderDateTime asc').limit(100)
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end
		if params[:findByOrderState] != nil then
			@orders = Order.where(orderState: params[:findByOrderState])
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i)
			end
		end

		if params[:findByOrderTagsIncludeAll] != nil then
			@orders = Order.all
			tags = params[:findByOrderTagsIncludeAll].split(",")
			tags.each{|tag|
				@orders = @orders.where("orderTags like '%" + tag + "%'")
			}
			if params[:limit] != nil then
				@orders = @orders.limit(params[:limit].to_i).order('orderDateTime asc')
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
				@orders = @orders.limit(params[:limit].to_i).order('orderDateTime asc')
			else
				@orders = @orders.limit(100).order('orderDateTime asc')
			end
		end



    	  @result = true
	      render status: :ok



	end
end
