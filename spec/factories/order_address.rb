FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk000000000000000"}
    postal_code {'123-4567'}
    prefecture_id { 2 }
    city {'東京都'}
    house_number {'1-2-3'}
    building_name {'東京ハイツ'}
    phone_number { '09012345678' }
  end
end