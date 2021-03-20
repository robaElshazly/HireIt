class UsersController < ApplicationController
  
    before_action :authenticate_user!, only:[:my_items]
  
    def my_items
        # query bookings where curent user is the owner(authorization),items table is preloaded(by includes when needed to be used in the veiw) ,also all customer users are preloaded from users table to use their names in the veiw(this will increase efficiency with more than one booking existing)
        @bookings=Booking.includes(:item,:customer_user).where(owner_user_id: current_user.id)
        #qeury to get all items belonging to the user, pickup_address was preloaded to be used in the veiw.
       @pagy, @items=pagy_countless(Item.includes(:pickup_address).where(user: current_user))
    end
end
