FactoryBot.define do
  factory :destination do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { 'Sample City' }
    address { '123 Sample Street' }
    building_name { 'Sample Building' }
    phone_number { '09012345678' }
    association :card
  end
end
