require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user= FactoryBot.create(:user)
    @item= FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = '０１２３４５６７８' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone は半角数字のみで入力してください")
      end
      it 'phoneが10桁未満では保存できないこと' do
        @order_address.phone = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end
      it 'phoneが11桁を超過すると保存できないこと' do
        @order_address.phone = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
