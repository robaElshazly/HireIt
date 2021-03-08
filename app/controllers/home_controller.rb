class HomeController < ApplicationController
    before_action :set_home_items
    def page
    end 
    private
 def set_home_items
    @items=Item.limit(6).order('id desc')
 end
end
