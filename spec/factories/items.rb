FactoryBot.define do
  factory :item do
    name { 'Example Item' }
    description { 'This is an example item description.' }
    shipping_id { 1 }
    condition_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    shipping_cost_id { 1 }
    price { 1000 }
    association :user
  end
end
