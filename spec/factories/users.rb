FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    read_first { 'タロウ' }
    read_last { 'ヤマダ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
