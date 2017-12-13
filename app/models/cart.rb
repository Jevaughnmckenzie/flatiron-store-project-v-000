class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items
	belongs_to :user
	delegate :current_cart, to: :user

	def total
		subtotals = line_items.map { |i| i.price * i.quantity }
		subtotals.sum
	end

	def add_item(item_id)
	
		if !self.items.where(id: item_id).empty?
			# binding.pry
			line_item = self.line_items.where(item_id: item_id).first
			line_item.quantity += 1
			# self.save
			line_item

		else
			self.line_items.build(quantity: 1, item_id: item_id)
			# self.save
			self.line_items.last
			
		end
	end


end
