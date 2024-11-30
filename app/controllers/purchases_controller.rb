class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


 private

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

end