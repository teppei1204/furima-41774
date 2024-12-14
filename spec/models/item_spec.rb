require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context 'バリデーションのテスト' do
    it 'nameが存在すること' do
      @item.name = nil
      expect(@item).not_to be_valid, 'nameが存在しない場合、@itemは有効ではありません'
    end

    it 'descriptionが存在すること' do
      @item.description = nil
      expect(@item).not_to be_valid, 'descriptionが存在しない場合、@itemは有効ではありません'
    end

    it 'shipping_idが存在すること' do
      @item.shipping_id = nil
      expect(@item).not_to be_valid, 'shipping_idが存在しない場合、@itemは有効ではありません'
    end

    it 'condition_idが存在すること' do
      @item.condition_id = nil
      expect(@item).not_to be_valid, 'condition_idが存在しない場合、@itemは有効ではありません'
    end

    it 'priceが300以上であること' do
      @item.price = 299
      expect(@item).not_to be_valid, 'priceが300未満の場合、@itemは有効ではありません'
    end

    it 'priceが9,999,999以下であること' do
      @item.price = 10_000_000
      expect(@item).not_to be_valid, 'priceが9,999,999を超える場合、@itemは有効ではありません'
    end
  end

  context 'アソシエーションのテスト' do
    it 'userと関連付けられていること' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to, 'userとのアソシエーションが期待通りに設定されていません'
    end
  end
end