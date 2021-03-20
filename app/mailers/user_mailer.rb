class UserMailer < ApplicationMailer
    default from: ENV['MAILER_FROM']
  
    def booking_email
        @user = params[:user]
        @item = params[:item]
        @booking=params[:booking]
      mail(to: @user.email, subject: 'Booking confirmation')
    end
  end