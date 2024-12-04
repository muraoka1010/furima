FactoryBot.define do
  factory :item_purchase do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '渋谷区1-1' }
    building_name { 'テストビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
