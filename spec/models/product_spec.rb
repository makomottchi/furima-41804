require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end   

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像が無いと登録できない' do
        @product.image = nil
        expect(@product).to_not be_valid
      end

      it '商品名が無いと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が無いと登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリー情報が無いと登録できない' do
        @product.category_id = 1 # "---"のidを1としている場合
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態情報が無いと登録できない' do
        @product.status_id = 1 # "---"のidを1としている場合
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担情報が無いと登録できない' do
        @product.shipping_cost_id = 1 # "---"のidを1としている場合
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域情報が無いと登録できない' do
        @product.prefecture_id = 1 # "---"のidを1としている場合
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数情報が無いと登録できない' do
        @product.shipping_day_id = 1 # "---"のidを1としている場合
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格情報が無いと登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')

      end
    end
  end
end
