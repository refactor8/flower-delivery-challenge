FactoryGirl.define do
  factory :shipping_method do

    factory :standard_delivery do
      name 'Standard Delivery'
      price 2.50
    end

    factory :special_delivery do
      name 'Special Delivery'
      price 5
    end
  end
end
