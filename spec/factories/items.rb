FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'これはテスト用の商品説明です。' }
    category_id { 2 } 
    status_id { 2 }  
    price { 1000 }    
    shipping_cost_id { 2 } 
    prefecture_id { 2 }    
    shipping_day_id { 2 }  
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end

  end
end
