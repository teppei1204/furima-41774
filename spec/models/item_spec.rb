require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できるとき' do
    it 'nameとdescriptionとprice（300から9999999）と画像が存在しており、category_id、condition_id、shipping_cost_id、prefecture_idが2以上が選択されているとき' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it '画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'category_idが1では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not included in the list")
    end

    it 'condition_idが1では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not included in the list")
    end

    it 'shipping_cost_idが1では出品できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not included in the list")
    end

    it 'prefecture_idが1では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not included in the list")
    end

    it 'shipping_day_idが1では出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day is not included in the list")
    end

    it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字では登録できない' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9999999を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが整数でないとき出品できない' do
      @item.price = 300.5
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end

    it 'userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end