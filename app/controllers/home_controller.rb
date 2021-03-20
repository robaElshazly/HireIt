class HomeController < ApplicationController
    before_action :set_home_items
   #  before_action :set_categories
    def page
    end 
 private

 def set_home_items
   #query to get only 6 recent items from db,pickup address was eagerloaded to join the pickup address table so hit the db only once.
    @items=Item.limit(6).eager_load(:pickup_address).order(created_at: :desc)
 end

#  def set_categories
#    @categories=Category.all
#  end
end
