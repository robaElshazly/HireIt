class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @item=Item.find(params[:item_id])
    if !@item
      respond_to do |format|
        format.html { redirect_to root_path, alert: "resource not found"}
       end
    end 

  end
end
