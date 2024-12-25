require 'rails_helper'

RSpec.describe CardForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @card_form = FactoryBot.build(:card_form, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@card_form).to be_valid
      end

      it '建物名が空でも保存できる' do
        @card_form.building_name = ''
        expect(@card_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できない' do
        @card_form.post_code = ''
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンが含まれていないと保存できない' do
        @card_form.post_code = '1234567'
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが0では保存できない' do
        @card_form.prefecture_id = 0
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @card_form.city = ''
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @card_form.address = ''
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @card_form.phone_number = ''
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @card_form.phone_number = '090123456789'
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Phone number is invalid. Must be 10 or 11 digits')
      end

      it 'phone_numberに英数字以外が含まれている場合は保存できない' do
        @card_form.phone_number = '090-1234-567'
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Phone number is invalid. Must be 10 or 11 digits')
      end

      it 'tokenが空では保存できない' do
        @card_form.token = ''
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存できない' do
        @card_form.user_id = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @card_form.item_id = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Item can't be blank")
      end
    end

    describe '保存機能のテスト' do
      it '正しい情報が入力されている場合、データベースに保存される' do
        expect do
          @card_form.save
        end.to change { Card.count }.by(1).and change { Destination.count }.by(1)
      end

      it '無効な情報の場合、データベースに保存されない' do
        @card_form.post_code = ''
        expect do
          @card_form.save
        end.not_to(change { Card.count })
      end
    end
  end
end
