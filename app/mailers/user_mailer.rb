class UserMailer < ApplicationMailer
    default from: ENV['MAILER_FROM']
  
    def booking_email
        @user = params[:user]
        @item = params[:item]
      mail(to: @user.email, subject: 'You have booked an item :)')
    end
  end