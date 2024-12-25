require 'rails_helper'

RSpec.describe Destination, type: :model do
  before do
    @destination = FactoryBot.build(:destination)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@destination).to be_valid
      end
    end

    context '配送先情報が保存できないとき' do
      it 'post_codeが空では保存できないこと' do
        @destination.post_code = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが不正な形式では保存できないこと' do
        @destination.post_code = '1234567'
        @destination.valid?
        expect(@destination.errors.full_messages).to include('Post code should follow the format XXX-XXXX')
      end

      it 'prefecture_idが空では保存できないこと' do
        @destination.prefecture_id = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できないこと' do
        @destination.city = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @destination.address = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @destination.phone_number = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが不正な形式では保存できないこと' do
        @destination.phone_number = '090123456'
        @destination.valid?
        expect(@destination.errors.full_messages).to include('Phone number only allows 10 to 11 digits')
      end
    end
  end

  describe 'アソシエーションのテスト' do
    it 'カードと関連付けされていること' do
      assoc = described_class.reflect_on_association(:card)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
