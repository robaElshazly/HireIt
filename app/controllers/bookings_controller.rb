class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def new
    @item=Item.find_by(id: params[:item_id])
    if !@item      #ensure item founf from URL exists
      respond_to do |format|
        format.html { redirect_to root_path, alert: "resource not found"}
       end
    elsif params[:start_date].blank? || params[:start_date].blank?
      respond_to do |format|
        format.html { redirect_to item_path(@item.id), alert: "Choose thime for booking before making a booking"}
       end
    elsif intersect_unavailable_dates      #ensure date in the URL does not intersect with unavailable dates in the database
        respond_to do |format|
          format.html { redirect_to root_path, alert: "unavailable booking time"}
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
            images: [@item.picture],
            amount: (@item.price*100).to_i,
            currency: 'aud',
            quantity: (Date.parse(params[:end_date])-Date.parse(params[:start_date])).to_i+1
          }  
        ],
        payment_intent_data: {metadata: {
          item_id: @item.id,
          start_date:Date.parse(params[:start_date]),
          end_date: Date.parse(params[:end_date]), 
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
    payment_id=params[:data][:object][:payment_intent]
    payment=Stripe::PaymentIntent.retrieve(payment_id)
    item_id=payment.metadata.item_id
    start_date= payment.metadata.start_date
    end_date=payment.metadata.end_date 
    customer_user_id=payment.metadata.customer_user_id
    owner_user_id=payment.metadata.owner_user_id
    Booking.create(customer_user_id: customer_user_id,owner_user_id: owner_user_id,item_id: item_id,start_date: start_date,end_date: end_date)
    render plain: "success"
  end

  private 

  
  def intersect_unavailable_dates  
    #intersection query (parameters times intersect any of booking times already exist)
    start_date=Date.parse(params[:start_date])
    end_date=Date.parse(params[:end_date])
    intersection=Booking.where('item_id = ? AND start_date <= ? AND end_date >= ?',params[:item_id], end_date,start_date)
    if intersection.length >0  #there is an intersection
      return true
    else
      return false
    end    
   end
end
