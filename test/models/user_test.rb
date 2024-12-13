require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '全てのフィールドが空の場合バリデーションエラーが発生すること' do
    user = User.new(name: '', nick_name: '', last_name: '', first_name: '', birth_day: '')
    assert user.invalid?
    assert_includes user.errors[:name], 'を入力してください'
    assert_includes user.errors[:nick_name], 'を入力してください'
    assert_includes user.errors[:last_name], 'を入力してください'
    assert_includes user.errors[:first_name], 'を入力してください'
    assert_includes user.errors[:birth_day], 'を入力してください'
  end

  test 'read_first と read_last がカタカナ以外の場合にバリデーションエラーが発生すること' do
    user = User.new(name: 'Example', read_first: 'あいうえお', read_last: 'さしすせそ')
    assert user.invalid?
    assert_includes user.errors[:read_first], 'はカタカナで入力してください'
    assert_includes user.errors[:read_last], 'はカタカナで入力してください'

    user.read_first = 'アイウエオ'
    user.read_last = 'サシスセソ'
    assert user.valid?
  end
end
