require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context 'バリデーションのテスト' do
    it 'nameが存在すること' do
      @item.name = nil
      expect(@item).not_to be_valid
    end

    it 'descriptionが存在すること' do
      @item.description = nil
      expect(@item).not_to be_valid
    end

    it 'shipping_idが存在すること' do
      @item.shipping_id = nil
      expect(@item).not_to be_valid
    end

    it 'condition_idが存在すること' do
      @item.condition_id = nil
      expect(@item).not_to be_valid
    end

    it 'priceが300以上であること' do
      @item.price = 299
      expect(@item).not_to be_valid
    end

    it 'priceが9,999,999以下であること' do
      @item.price = 10_000_000
      expect(@item).not_to be_valid
    end
  end

  context 'アソシエーションのテスト' do
    it 'userと関連付けられていること' do
      expect(@item.user).not_to be_nil
    end
  end
end
