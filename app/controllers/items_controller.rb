class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.order(updated_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :price, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

end
