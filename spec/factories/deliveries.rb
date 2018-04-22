FactoryGirl.define do
  factory :delivery do
    bouquet %w('Alice', 'Isabel', 'Charlotte').sample
    recipient_name %w('Ryan', 'John', 'Mary', 'Charles').sample
    delivery_on 10.days.from_now
    association :order
    shipping_method "Standard Delivery"
  end
end
