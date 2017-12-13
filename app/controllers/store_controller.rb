class StoreController < ApplicationController
  
  def index
  	@user = current_user
  	@categories = Category.all
  	@items = Item.available_items
  	@cart = current_user.current_cart
  end
end
