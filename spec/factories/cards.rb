FactoryBot.define do
  factory :card do
    association :user
    association :item
  end
end
