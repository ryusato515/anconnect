FactoryBot.define do
  factory :post do
    comment { "This is a test comment" }
    name { "Test Post Name" }
    shop_name { "Test Shop Name" }
    address { "Test Address" }
    association :user
    association :prefecture
    association :ingredient
    association :cooking_method

    
  end
end