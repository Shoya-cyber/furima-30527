FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '鈴木' }
    first_name { '太郎' }
    family_name_reading { 'スズキ' }
    first_name_reading { 'タロウ' }
    birth_date { '1930-1-1' }
  end
end
