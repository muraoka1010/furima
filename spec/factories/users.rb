require 'faker'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email } # Fakerを使ってランダムなメールを生成
    password { 'password123' }
    password_confirmation { 'password123' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end