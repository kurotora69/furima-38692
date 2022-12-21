require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格、商品画像が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it '商品の状態が空では登録できない' do
        @item.detail_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it '発送元の地域が空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it '発送までの日数が空では登録できない' do
        @item.number_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '価格が299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end

      it '価格¥10,000,000以上は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '12kkあ'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
