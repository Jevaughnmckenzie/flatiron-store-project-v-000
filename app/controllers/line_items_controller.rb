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
		cart.add_item(line_item_params[:item_id])
		cart.save

		redirect_to cart_path(cart)
		
	end

	private

	def line_item_params
		params.require(:item).permit(:item_id)

	end

end
