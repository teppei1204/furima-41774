require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    it 'nick_nameが存在すること' do
      # FactoryBotを使用してUserを生成
      user = FactoryBot.build(:user, nick_name: '')
      expect(user).not_to be_valid
    end

    it 'last_nameが存在すること' do
      user = FactoryBot.build(:user, last_name: '')
      expect(user).not_to be_valid
    end

    it 'first_nameが存在すること' do
      user = FactoryBot.build(:user, first_name: '')
      expect(user).not_to be_valid
    end

    it 'birth_dayが存在すること' do
      user = FactoryBot.build(:user, birth_day: nil)
      expect(user).not_to be_valid
    end

    it 'read_firstがカタカナであること' do
      user = FactoryBot.build(:user, read_first: 'Tarou')
      expect(user).not_to be_valid
    end

    it 'read_lastがカタカナであること' do
      user = FactoryBot.build(:user, read_last: 'Yamada')
      expect(user).not_to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    it 'itemと関連付けられていること' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
  end
end
