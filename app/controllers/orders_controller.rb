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
    @cart = current_cart
     @order = Order.new(order_params)
     @order.add_line_items_from_cart(@cart)
     @order.card_token = params[:stripeToken]
      customer = Stripe::Customer.create(
        :email => @order.email,
        :card  => @order.card_token
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (@cart.total_price*100).to_i,
        :description => 'Lugnuts Purchase',
        :currency    => 'usd'
      )
      respond_to do |format|
      if @order.save
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
        format.html { redirect_to(root_url, :notice => 
          'Thank you for your order.') }
        
      else
        @cart = current_cart
        format.html { render :action => "new" }
      
      
       end 
     end 
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
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
      params.require(:order).permit(:name, :address, :email, :pay_type, :card_token)
    end

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
