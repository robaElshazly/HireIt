class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :set_categories
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource
  # GET /items or /items.json
  def index
    
    if !params[:category_id].blank?
      #select recent items first ,pickup address was eagerloaded to join the pickup address with items table table and hit the db only once.
      @pagy,@items= pagy_countless(Item.order(created_at: :desc).eager_load(:pickup_address).where(category_id: params[:category_id]))
    else  
      @pagy,@items = pagy_countless(Item.order(created_at: :desc).eager_load(:pickup_address).search(params[:search]))
    end  
  end

  # GET /items/1 or /items/1.json
  def show
    if !@item
      respond_to do |format|
        format.html { redirect_to root_path, alert: "resource not found"}
       end
    end  
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.build_pickup_address
  end

  # GET /items/1/edit
  def edit
 
  end

  # POST /items or /items.json
  def create
    #get the address from db that matches address params
    address = PickupAddress.find_by(item_params[:pickup_address_attributes])
    #check if address already exists ,if not , create a new address
    address=address||PickupAddress.create(item_params[:pickup_address_attributes])

    item_address_parameters={name:item_params[:name], price: item_params[:price], description: item_params[:description], category_id: item_params[:category_id],pickup_address: address,user: current_user}

    @item = Item.new(item_address_parameters)
    if @item.save
      flash[:notice] = "Item Created"
      redirect_to my_items_path
    else
      flash.now[:alert] = @item.errors.full_messages.to_sentence
      set_categories
      render "new"
    end
   @item.picture.attach(item_params[:picture])
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|  
        #get the address from db that matches address params
        address = PickupAddress.find_by(item_params[:pickup_address_attributes])
        #check if address already exists ,if not , create a new address
        address=address||PickupAddress.create(item_params[:pickup_address_attributes])

        item_parameters={name:item_params[:name], price: item_params[:price], description: item_params[:description], category_id: item_params[:category_id],pickup_address: address,user: current_user}

        if @item.update(item_parameters)
          @item.picture.attach(item_params[:picture]) if item_params.has_key?(:picture)
          format.html { redirect_to @item, notice: "Item was successfully updated." }
          format.json { render :show, status: :ok, location: @item }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
       @item.destroy
       respond_to do |format|
        format.html { redirect_to my_items_url, notice: "Item was successfully destroyed."}
      end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :picture, pickup_address_attributes: [:address,:suburb,:postcode,:state])
    end

end
