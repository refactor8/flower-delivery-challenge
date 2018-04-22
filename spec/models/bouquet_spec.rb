require 'rails_helper'

RSpec.describe Bouquet, :type => :model do
  it 'has a valid factory' do
    expect(build(:bouquet)).to be_valid
  end

  it 'is invalid without a name' do
    bouquet = build(:bouquet, name: nil)
    bouquet.valid?
    expect(bouquet.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    bouquet = build(:bouquet, price: nil)
    bouquet.valid?
    expect(bouquet.errors[:price]).to include("can't be blank")
  end
end
