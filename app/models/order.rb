class Order < ActiveRecord::Base
  belongs_to :bouquet
  belongs_to :shipping_method

  validates :recipient_name, :delivery_on, :bouquet, :cost, :status, :shipping_method, presence: true

  before_validation :assign_cost
  before_validation :determined_billed, unless: Proc.new { |o| o.status.eql? 'complete' }

  def assign_cost
    return if self.bouquet.blank? || self.shipping_method.blank?
    self.cost = (self.three_month_bundle ? set_discounts(self.bouquet.id) : self.bouquet.price)
    self.cost += self.shipping_method.price
  end

  # This is a method that fakes a 10% failure rate on billing
  def determined_billed
    if Random.rand(10) == 1
      self.status = 'failed'
    else
      self.status = 'billed'
    end
  end

  private

  def set_discounts(id)
    price = self.bouquet.price * 3
    price *= 0.90 if (2..3).cover? id
    price
  end
end
