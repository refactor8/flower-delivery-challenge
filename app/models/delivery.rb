class Delivery < ApplicationRecord
  belongs_to :order
  validates :bouquet, :recipient_name, :delivery_on, :order, :shipping_method, presence: true
end
