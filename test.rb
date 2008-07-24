class TestArray
	attr_reader :items
	def initialize
		@items = Array.new
	end
	
	def add_item (product)
		@items << product
	end
end

a = TestArray.new
a.add_item "teste blah"
a.items
