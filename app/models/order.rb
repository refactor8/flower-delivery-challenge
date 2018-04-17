class Order < ActiveRecord::Base
  belongs_to :bouquet

  validates :recipient_name, :delivery_on, :bouquet, :cost, :status, presence: true

  before_validation :assign_cost, :determined_billed

  def assign_cost
    self.cost = bouquet.price if bouquet
  end

  # This is a method that fakes a 10% failure rate on billing
  def determined_billed
    if Random.rand(10) == 1
      self.status = 'failed'
    else
      self.status = 'billed'
    end
  end
end
