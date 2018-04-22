require_relative '../../lib/tasks/delivery_helper.rb'

describe DeliveryHelper do
  context "when delivering a standard order" do
    it '.shipping' do
      3.times { create(:order, delivery_on: Date.today) }
      DeliveryHelper.shipping(Date.today)
      orders = Order.where(status: 'complete', delivery_on: Date.today).count
      expect(orders).to eq 3
    end
  end

  context "when delivering a special order" do
    it '.shipping' do
      3.times { create(:order, delivery_on: Date.today, three_month_bundle: true) }
      DeliveryHelper.shipping(Date.today)
      orders = Order.where(status: 'complete', delivery_on: Date.today).count
      expect(orders).to eq 3
    end
  end
end
