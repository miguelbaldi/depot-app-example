class OrderController < ApplicationController
  def list_all
  	@orders = Order.find(:all)
  end

end
