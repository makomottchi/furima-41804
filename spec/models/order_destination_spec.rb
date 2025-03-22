require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product, user: @user)
    @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, product_id: @product.id)
    sleep 0.1 # デットロック回避のための一時的なスリープ
  end

  describe '注文情報の保存' do
    context '保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存ができること' do
        expect(@order_destination).to be_valid
      end

      it 'building_nameが空でも保存ができること' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'post_codeが空だと保存ができないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと保存ができないこと' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが0の時保存ができないこと' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存ができないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存ができないこと' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存ができないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では保存ができないこと' do
        @order_destination.phone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end

      it 'phone_numberが12桁以上では保存ができないこと' do
        @order_destination.phone_number = '090123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end

      it 'phone_numberにハイフンが含まれていると保存ができないこと' do
        @order_destination.phone_number = '090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end
    end
  end
end