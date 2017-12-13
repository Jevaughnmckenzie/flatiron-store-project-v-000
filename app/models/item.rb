class Item < ActiveRecord::Base
	has_many :line_items
	belongs_to :category

	def self.available_items
		self.all.select do |item|
			if item.inventory.present?
				item.inventory > 0
			end
		end
	end

	# def price
	# 	super/100
	# end
end
