FactoryGirl.define do
  factory :order do
    recipient_name ['Ryan', 'John', 'Mary', 'Charles'].sample
    delivery_on 10.days.from_now
    association :bouquet
    shipping_method { FactoryGirl.build(:standard_delivery) }
    status 'billed'

    factory :special_order do
      shipping_method { FactoryGirl.build(:special_delivery)  }
    end

    factory :three_month_bundle do
      three_month_bundle true
    end
  end
end
