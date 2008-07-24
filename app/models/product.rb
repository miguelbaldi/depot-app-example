class Product < ActiveRecord::Base
	has_many :line_items
	validates_presence_of :title, :description, :image_url
	validates_uniqueness_of :title, :message => "Title must be unique"
	validates_numericality_of :price
	validates_format_of :image_url,
											:with => %r{\.(gif|jpg|png)$}i,
											:message => "must be a URL for a GIF, JPG, or PNG image"
	validates_length_of :title, :maximum => 50

	def self.find_products_for_sale
		find(:all, :order => "title" )
	end

	protected
	def validate
		errors.add(:price, "should be at least 0.01" ) if price.nil? || price < 0.01
	end	
	
end
