# factories.rb
FactoryBot.define do
  factory :food do
    name { 'Sample food' }
    measurement_unit { 'kg' }
    price { 20 }
    quantity { 3 }
    association :user
  end
  
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password' }
  end
end
  