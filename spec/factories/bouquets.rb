FactoryGirl.define do
  factory :bouquet do
    name %w('Alice', 'Isabel', 'Charlotte').sample
    price 20.0

    factory :bouquet_1 do
      name 'Alice'
    end

    factory :bouquet_2 do
      name 'Isabel'
    end

    factory :bouquet_3 do
      name 'Charlotte'
    end
  end
end
