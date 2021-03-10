class UsersController < ApplicationController
  
    before_action :authenticate_user!, only:[:my_items]
  
    def my_items
        # authorization query
       @pagy, @items=pagy(Item.where(user: current_user))
    end
end
