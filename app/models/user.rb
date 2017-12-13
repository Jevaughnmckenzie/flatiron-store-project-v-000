class User < ActiveRecord::Base
  has_many :carts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  # attr_writer :current_cart

  def current_cart=(cart)
  	if cart.nil?
      self.current_cart_id = nil
    else
      self.current_cart_id = cart.id
      unless save
        raise "Cart ID didn't save for some reason".inspect
      end
    end
  end

  def current_cart
  	# binding.pry
   	#@cart = carts.last || self.carts.create
   	self.current_cart_id.nil? ? nil : Cart.find(current_cart_id)
  end

  #current_cart_id.nil? ? nil : cart
  # add line item, then create a cart and set current_card_id = cart.id
  # checkout => set current_card_id to nil and save
end
