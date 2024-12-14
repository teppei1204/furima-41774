FactoryBot.define do
  factory :user do
    nick_name { 'テストユーザー' }
    first_name { '一郎' }
    last_name { '山田' }
    read_first { 'タロウ' }
    read_last { 'ヤマダ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
