class Cart
	
	attr_reader :items
	
	def initialize
		@items = Array.new
	end
	
	def add_product(product)
		current_item = @items.find {|item| item.product == product}
		if current_item
			current_item.increment_quantity
		else
			current_item = CartItem.new(product)
			@items << current_item
		end
		current_item
	end

	def remove_product(product)
		item_to_remove = @items.find {|item| item.product == product}
		if item_to_remove
			if item_to_remove.quantity > 1 then item_to_remove.decrement_quantity 
			else 
				item_to_remove.decrement_quantity
				@items.delete_at(@items.index(item_to_remove))
			end
		end
		item_to_remove
	end
	
	def total_price
		@items.sum { |item| item.price }
	end
	
	def total_items
		@items.sum { |item| item.quantity }	
	end
	
end
