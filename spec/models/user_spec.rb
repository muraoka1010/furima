require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    let(:user) { build(:user) }

      it 'メールアドレスが空では登録できない' do
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性でないと登録できない' do
        create(:user, email: 'test@example.com') # 既存のユーザー
        user.email = 'test@example.com'
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@が含まれていないと登録できない' do
        user.email = 'testexample.com'
        user.valid?
        expect(user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空では登録できない' do
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        user.password = '12345'
        user.password_confirmation = '12345'
        user.valid?
        expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードとパスワード（確認）が一致しない場合は登録できない' do
        user.password = 'password123'
        user.password_confirmation = 'password456'
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  end
end