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
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it 'last_nameが存在しない場合無効であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが正しいフォーマットでない場合無効であること' do
        @user.last_name = 'invalid_format'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが存在しない場合無効であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが正しいフォーマットでない場合無効であること' do
        @user.first_name = 'invalid_format'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'birth_dayが存在しない場合無効であること' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'read_firstがカタカナでない場合無効であること' do
        @user.read_first = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first is invalid')
      end

      it 'read_lastがカタカナでない場合無効であること' do
        @user.read_last = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last is invalid')
      end

      it 'passwordが文字と数字を含まない場合無効であること' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
      end
    end
  end
end
