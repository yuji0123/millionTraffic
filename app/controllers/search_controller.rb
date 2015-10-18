class SearchController < ApplicationController


	def findby
		@orders = Order.all
		if params[:findByOrderDateTimeGTE] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderDateTime >= '
			query_str << params[:findByOrderDateTimeGTE]
			query_str << ' order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)

		end
		if params[:findByOrderDateTimeLTE] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderDateTime <= '
			query_str << params[:findByOrderDateTimeLTE]
			query_str << ' order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)
		end
		if params[:findByOrderUserId] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderUserId = "'
			query_str << params[:findByOrderUserId]
			query_str << '" order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)
		end
		if params[:findByOrderItemId] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderItemId = "'
			query_str << params[:findByOrderUserId]
			query_str << '" order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)
		end
		if params[:findByOrderQuantityGTE] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderQuantity >= '
			query_str << params[:findByOrderQuantityGTE]
			query_str << ' order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)
		end
		if params[:findByOrderQuantityLTE] != nil then
			query_str = ''
			query_str << 'select * from orders where orders.orderQuantity >= '
			query_str << params[:findByOrderQuantityLTE]
			query_str << ' order by orderDateTime desc limit '
			query_str << params[:limit]
			@orders = @orders.find_by_sql(query_str)
		end
		if params[:findByOrderState] != nil then
			@orders = @orders.where(orderState: params[:findByOrderState])
		end

		if params[:findByOrderTagsIncludeAll] != nil then
			query_str = ''
			query_str << 'select * from orders '
			tags = params[:findByOrderTagsIncludeAll].split(",")
			lastTag = tags.last
			tags.each{|tag|
				_tag = tag
				query_str << 'where orders.orderTags '
				query_str << 'like "%'
				query_str << _tag
				query_str << '%"'
				if _tag != lastTag then
					query_str << ' or '
				end
			}
			query_str << ' limit '
			query_str << params[:limit]
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
		# if params[:limit] != nil then
		# 		@orders = @orders.limit(params[:limit].to_i)
		# end


    	  @result = true
	      render status: :ok
	end
end