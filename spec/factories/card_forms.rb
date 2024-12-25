FactoryBot.define do
  factory :card_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item

    after(:build) do |card_form|
      card_form.user_id = card_form.user.id
      card_form.item_id = card_form.item.id
    end
  end
end
