require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が出品できるとき' do
      it '画像とテキストを保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'explainが空では登録できない' do
        @item.explain = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'paymentが空では登録できない' do
        @item.payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'dayが空では登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'priceが300円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが10,000,000以上では登録できない' do
        @item.price = 11_111_111
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'ユーザーが紐づいてなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('must exist')
      end
    end
  end
end
