class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
  end


 private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
