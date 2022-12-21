require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.3
  end

  describe '商品購入' do

    context '商品購入できるとき' do

      it '空欄がない、かつtokenがあれば購入できる' do 
        expect(@order).to be_valid
      end  

      it '建物名が空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end  

    end


    context '商品購入できないとき' do

      it '郵便番号が空では登録できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end  

      it '都道府県空では登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end 

      it '市区町村空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号空では登録できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号は「-」を含まないと購入できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end  

      it '都道府県が「1」の場合は購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end 

      it '電話番号が12桁以上は購入できない' do
        @order.tel = '0987654321000'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が９桁以下は購入できない' do
        @order.tel = '09876543'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end 

      it '電話番号に半角数値以外が含まれたら購入できない' do
        @order.tel = '09@asd1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'user_idが結びついていなければ登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end 

      it 'item_idが結びついていなければ登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end  

    end

  end    

end  