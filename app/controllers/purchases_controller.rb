class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @item_purchase.valid?
      Payjp.api_key = "sk_test_4da2cfb18252871f0355de9b"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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

end
