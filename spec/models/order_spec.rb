require 'rails_helper'

RSpec.describe Order, :type => :model do
  it 'has a valid factory' do
    expect(build(:order)).to be_valid
  end

  it 'is invalid without a receipient name' do
    order = build(:order, recipient_name: nil)
    order.valid?
    expect(order.errors[:recipient_name]).to include("can't be blank")
  end

  it 'is invalid without a delivery_on date' do
    order = build(:order, delivery_on: nil)
    order.valid?
    expect(order.errors[:delivery_on]).to include("can't be blank")
  end

  it 'assigns a cost to a special order' do
    special_delivery = build(:special_delivery)
    order = create(:order, cost: nil, shipping_method: special_delivery)
    expect(order.cost).to eq 25
  end

  it 'gets a discount on a three month bundle order (bouquet #2)' do
    bouquet_2 = build(:bouquet_2)
    standard_delivery = build(:standard_delivery)
    order = create(:three_month_bundle, cost: nil, bouquet: bouquet_2, shipping_method: standard_delivery)
    expect(order.cost).to eq 62.5
  end

  it 'gets a discount on a three month bundle order (bouquet #3)' do
    bouquet_3 = create(:bouquet_3)
    standard_delivery = create(:standard_delivery)
    order = create(:three_month_bundle, bouquet: bouquet_3, shipping_method: standard_delivery)
    expect(order.cost).to eq 62.5
  end

  it 'assigns a cost to a standard order' do
    standard_delivery = build(:standard_delivery)
    order = create(:order, cost: nil, shipping_method: standard_delivery)
    expect(order.cost).to eq 22.5
  end

  it 'returns the payment status' do
    order = build(:order)
    expect(order.status).to eq('billed').or eq('failed')
  end

  it 'is invalid without a bouquet' do
    order = build(:order, bouquet: nil)
    order.valid?
    expect(order.errors[:bouquet]).to include("can't be blank")
  end

  it 'is invalid without a shipping method' do
    order = build(:order, shipping_method: nil)
    order.valid?
    expect(order.errors[:shipping_method]).to include("can't be blank")
  end

  it 'should belongs to Bouquet' do
    expect(Order.reflect_on_association(:bouquet).macro).to eq(:belongs_to)
  end

  it 'should belongs to Shipping Method' do
    expect(Order.reflect_on_association(:shipping_method).macro).to eq(:belongs_to)
  end
end
