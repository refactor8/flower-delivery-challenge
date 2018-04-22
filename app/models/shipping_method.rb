class ShippingMethod < ApplicationRecord
  validates :name, :price, presence: true
end
