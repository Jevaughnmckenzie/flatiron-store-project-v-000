class StoreController < ApplicationController
  
  def index
  	@user = current_user
  	@categories = Category.all
  	@items = Item.available_items
  	!!current_user ? @cart = current_user.current_cart : @cart = nil
  end
end
