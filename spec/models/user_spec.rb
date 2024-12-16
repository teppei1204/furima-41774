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

      it 'read_firstが空では登録できないこと' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end

      it 'read_firstが正しいフォーマットでない場合無効であること' do
        @user.read_first = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first is invalid')
      end

      it 'read_lastが空では登録できないこと' do
        @user.read_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last can't be blank")
      end

      it 'read_lastが正しいフォーマットでない場合無効であること' do
        @user.read_last = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last is invalid')
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複している場合無効であること' do
        FactoryBot.create(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合無効であること' do
        @user.email = 'invalid_example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上でないと登録できないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが一致していないと登録できないこと' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
      end

      it 'passwordが全角だと登録できないこと' do
        @user.password = 'ｐａｓｓｗｏｒｄ１'
        @user.password_confirmation = 'ｐａｓｓｗｏｒｄ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
      end

      it 'passwordが文字と数字を含まない場合無効であること' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
      end
    end
  end
end
