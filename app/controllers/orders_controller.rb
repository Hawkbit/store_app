class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @cart = current_cart
    
    if @cart.line_items.empty?
        redirect_to root_url, notice: "Your cart is empty"
        return 
    end 
      @order = Order.new
    respond_to do |format|
        format.html
        format.json {render json: @order }
     end 
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
        if @order.save
            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            format.html{redirect_to root_url, notice: 'Thank you for your order.'}
            format.json {render json: @order, status: :created, 
                location: @order}
        else 
            @cart = current_cart
            format.html {render action: "new"}
            format.json {render json: @order.errors, 
                status: :unprocessable_entity}
        end 
    end 
  end 
  

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
