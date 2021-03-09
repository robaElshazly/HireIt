class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :set_categories
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /items or /items.json
  def index
    
    if !params[:category_id].blank?
      @pagy,@items= pagy(Item.where(category_id: params[:category_id]).recent_first)
    else  
      @pagy,@items = pagy(Item.search(params[:search]))
    end  
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params.merge(user: current_user))

    if @item.save
      flash[:success] = "Item Created"
      redirect_to items_path
  else
      flash.now[:error] = @item.errors.full_messages.to_sentence
      set_categories
      render "new"
  end

    # respond_to do |format|
    #   # if @item.save
    #   #   format.html { redirect_to @item, notice: "Item was successfully created." }
    #   #   format.json { render :show, status: :created, location: @item }
    #   #   redirect_to items_path
    #   # else
    #   #   # format.html { render :new, status: :unprocessable_entity }
    #   #   # format.json { render json: @item.errors, status: :unprocessable_entity }
    #   #   redirect_to "new"
    #   # end
    # end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
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
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :picture)
    end

    # def set_categories
    #   @categories=Category.all
    # end
end
