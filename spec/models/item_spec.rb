require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'item_name、image、description、price、category_id、condition_id、recipient_id、prefecture_id、shipment_idが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像を1枚つけることが必須であること。' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること。' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須であること。' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること。' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること。' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が必須であること。' do
        @item.recipient_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Recipient can't be blank")
      end
      it '発送元の地域の情報が必須であること。' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須であること。' do
        @item.shipment_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it '価格の情報が必須であること。' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は半角数値のみ保存可能であること。' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input Half-width number")
      end
      it '価格は、小数を含んでいては保存できないこと。' do
        @item.price = "1000.45"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it '価格は、¥299以下では保存できないこと。' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格は、¥10,000,000以上では保存できないこと。' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'userが紐づいていなければ、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
