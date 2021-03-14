class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @item=Item.find(params[:item_id])
    if !@item
      respond_to do |format|
        format.html { redirect_to root_path, alert: "resource not found"}
       end
    else
      Stripe.api_key=ENV['STRIPE_SK_TEST']
      @session=Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        success_url: booking_success_url,
        cancel_url: booking_cancel_url,
        line_items: [
          {
            name: @item.name,
            description: @item.description,
            images: [@item.picture],
            amount: (@item.price*100).to_i,
            currency: 'aud',
            quantity: params[:end_date].to_i-params[:start_date].to_i+1,
          }  
        ],
        payment_intent_data: {metadata: {
          item_id: @item.id,
          start_date: params[:start_date],
          end_date: params[:end_date], 
          customer_user_id: current_user.id, 
          owner_user_id:@item.user_id
        }
      }
      )
    end  
  end

  def success
  end

  def cancel
  end
  def webhook
  end
end
