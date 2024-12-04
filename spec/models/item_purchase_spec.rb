require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_purchase = FactoryBot.build(:item_purchase , user_id: user.id, item_id: item.id) # FactoryBotでテスト用データを生成
  end

  describe '購入情報の保存' do
    context '保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item_purchase).to be_valid
      end

      it '建物名が空でも保存できる' do
        @item_purchase.building_name = ''
        expect(@item_purchase).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'user_idが空では保存できない' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @item_purchase.item_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空では保存できない' do
        @item_purchase.postal_code = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが含まれていないと保存できない' do
        @item_purchase.postal_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code はハイフンを含む形式で入力してください")
      end

      it '都道府県が1（選択されていない状態）では保存できない' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture を選択してください")
      end

      it '市区町村が空では保存できない' do
        @item_purchase.city = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @item_purchase.address = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @item_purchase.phone_number = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number は10桁以上11桁以内の数字で入力してください")
      end

      it '電話番号が9桁以下では保存できない' do
        @item_purchase.phone_number = '123456789'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number は10桁以上11桁以内の数字で入力してください")
      end

      it '電話番号が12桁以上では保存できない' do
        @item_purchase.phone_number = '123456789012'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number は10桁以上11桁以内の数字で入力してください")
      end

      it '電話番号に数字以外が含まれていると保存できない' do
        @item_purchase.phone_number = '123-4567-890'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number は10桁以上11桁以内の数字で入力してください")
      end

      it 'tokenが空では保存できない' do
        @item_purchase.token = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
