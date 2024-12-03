class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    if @item.purchase.present? ||  current_user == @item.user
      redirect_to root_path
    end
    @item_purchase = ItemPurchase.new
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item_purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


 private

  def purchase_params
    params.require(:item_purchase).permit(
    :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token).
    merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
