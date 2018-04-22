require 'rails_helper'

RSpec.describe ShippingMethod, type: :model do
  it 'has a valid factory' do
    expect(build(:standard_delivery)).to be_valid
  end

  it 'is invalid without a name' do
    shipping_method = build(:standard_delivery, name: nil)
    shipping_method.valid?
    expect(shipping_method.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    shipping_method = build(:standard_delivery, price: nil)
    shipping_method.valid?
    expect(shipping_method.errors[:price]).to include("can't be blank")
  end
end
