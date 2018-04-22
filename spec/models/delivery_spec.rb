require 'rails_helper'

RSpec.describe Delivery, type: :model do
  it 'has a valid factory' do
    expect(build(:delivery)).to be_valid
  end

  it 'is invalid without a bouquet' do
    delivery = build(:delivery, bouquet: nil)
    delivery.valid?
    expect(delivery.errors[:bouquet]).to include("can't be blank")
  end

  it 'is invalid without a recipient_name' do
    delivery = build(:delivery, recipient_name: nil)
    delivery.valid?
    expect(delivery.errors[:recipient_name]).to include("can't be blank")
  end

  it 'is invalid without a delivery date' do
    delivery = build(:delivery, delivery_on: nil)
    delivery.valid?
    expect(delivery.errors[:delivery_on]).to include("can't be blank")
  end

  it 'is invalid without a shipping method' do
    delivery = build(:delivery, shipping_method: nil)
    delivery.valid?
    expect(delivery.errors[:shipping_method]).to include("can't be blank")
  end

  it 'should belongs to Order' do
    expect(Order.reflect_on_association(:shipping_method).macro).to eq(:belongs_to)
  end
end
