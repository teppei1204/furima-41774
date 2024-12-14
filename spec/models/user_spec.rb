require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
      it '有効なユーザーであること' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'nick_nameが存在しない場合無効であること' do
        @user.nick_name = ''
        expect(@user).not_to be_valid
      end

      it 'last_nameが存在しない場合無効であること' do
        @user.last_name = ''
        expect(@user).not_to be_valid
      end

      it 'first_nameが存在しない場合無効であること' do
        @user.first_name = ''
        expect(@user).not_to be_valid
      end

      it 'birth_dayが存在しない場合無効であること' do
        @user.birth_day = nil
        expect(@user).not_to be_valid
      end

      it 'read_firstがカタカナでない場合無効であること' do
        @user.read_first = 'Tarou'
        expect(@user).not_to be_valid
      end

      it 'read_lastがカタカナでない場合無効であること' do
        @user.read_last = 'Yamada'
        expect(@user).not_to be_valid
      end
    end
  end
end
