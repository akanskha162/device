class OrdersController < ApplicationController
  
  def express_checkout
    
     response = EXPRESS_GATEWAY.setup_purchase(1000,
      
      ip: request.remote_ip,
      return_url: create_url,
      cancel_return_url: root_url,
      currency: "USD",
      allow_guest_checkout: true,
      items: [{name: "Order", description: "Order description", quantity: "1", amount: 1000}]
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  def express_purchase_options
    {
      :ip => ip,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end

  def new
    @order = Order.new(:express_token => params[:token])
  end

  def create
 
    @order = Order.new(express_token:params[:token],express_payer_id: params[:PayerID])

    if @order.save
      if @order.purchase 
        redirect_to root_url(@order)
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end

      
end
