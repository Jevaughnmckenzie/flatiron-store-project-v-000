class LineItemsController < ApplicationController

	def create
		
		# if current_user_cart.nil?
		# 	current_user_cart = current_user.carts.create
		# end
				
		# current_user_cart.add_item(line_item_params[:item_id])
		# current_cart.save
		# redirect_to cart_path(current_cart)

		if current_user.current_cart.nil?
			# raise 
			current_user.current_cart = current_user.carts.create
			# raise
		end

		cart = current_user.current_cart
		new_line_item = cart.add_item(params[:item_id])
		new_line_item.save
		# binding.pry

		redirect_to cart_path(cart)
		
	end

	

end
