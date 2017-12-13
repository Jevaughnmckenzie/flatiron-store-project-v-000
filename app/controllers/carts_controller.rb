class CartsController < ApplicationController
	def show
		# raise current_user.inspect
		# binding.pry	
		@current_cart = current_user.current_cart
		
		# raise @current_cart.inspect
	end

	def checkout
		#needs to access line items from the current cart
		#needs to take the quanities of each line item, and subtract them from the corresponding item's inventory
		#needs to set current cart to nil
		current_user.current_cart_id = nil
		current_user.save
		# binding.pry
		#needs to redirect back to the cart's page
		redirect_to cart_path(current_user.carts.last)
	end

end


