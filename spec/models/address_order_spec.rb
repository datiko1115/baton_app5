require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @address_order = FactoryBot.build(:address_order, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it '必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができること' do
        expect(@address_order).to be_valid
      end

      it '建物名は任意であること。' do
        @address_order.building = ""
        expect(@address_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること。' do
        @address_order.postcode = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）' do
        @address_order.postcode = "1111-111"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が必須であること。' do
        @address_order.prefecture_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること。' do
        @address_order.city = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること。' do
        @address_order.address = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること。' do
        @address_order.phone = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は、半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。' do
        @address_order.phone = "aaa-aaa-aaa"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone is invalid. Input Half-width number")
      end
      it '電話番号は、10桁以上11桁以内のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。' do
        @address_order.phone = "090123456"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone is too short")
      end

    end
  end
end
