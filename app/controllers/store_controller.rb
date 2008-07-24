class StoreController < ApplicationController

	before_filter :find_cart, :except => :empty_cart

  def index
    @products = Product.find_products_for_sale
    if session[:index_counter].nil?
      session[:index_counter] = 1
    else
      session[:index_counter] += 1
    end
    @counter = session[:index_counter]
  end

  def add_to_cart
    begin
      product = Product.find (params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index "Invalid product"
    else
      @current_item = @cart.add_product(product)
      session[:index_counter] = nil
      if request.xhr?
        respond_to { |format| format.js }
      else
        redirect_to_index
      end
    end
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index unless request.xhr?
  end

  def remove_from_cart
    begin
      product = Product.find (params[:id])
    rescue ActiveRecord::RecordNotFound => e
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index "Invalid product"
    else
      @current_item = @cart.remove_product(product)
      logger.debug "Current item quantity: #{@current_item.quantity}"
      if request.xhr?
        respond_to { |format| format.js }
      else
        redirect_to_index "Item #{@current_item.title} was removed"
      end
    end
  end

  def checkout
    if @cart.items.empty?
      redirect_to_index("Your cart is empty" )
    else
      @order = Order.new
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index "Thank you for your order"
    else
      render :action => :checkout
    end
  end

	## Private methods
	
  private

  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end
  
  def authorize
  	
  end
end

