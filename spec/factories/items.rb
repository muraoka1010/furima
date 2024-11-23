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

  end
end
