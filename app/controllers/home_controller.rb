class HomeController < ApplicationController
    before_action :set_home_items
   #  before_action :set_categories
    def page
    end 
 private

 def set_home_items
    @items=Item.limit(6).order('id desc')
 end

#  def set_categories
#    @categories=Category.all
#  end
end
