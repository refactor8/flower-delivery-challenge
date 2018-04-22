class DeliveryHelper
  class << self
    STATUS_COMPLETE = "complete"

    def shipping(delivery_on)
      return unless delivery_on

      Order.where(delivery_on: delivery_on, status: 'billed').each do |order|
        order.three_month_bundle ? three_month_bundle(order) : standard_delivery(order, delivery_on)
      end
    end

    def standard_delivery(order, delivery_on)
      create_delivery(order, delivery_on)
      set_status(order, STATUS_COMPLETE)
    end

    def three_month_bundle(order)
      delivery_on = order.delivery_on
      3.times do |i|
        create_delivery(order, delivery_on)
        delivery_on += 1.month
      end
      set_status(order, STATUS_COMPLETE)
    end

    def set_status(order, status)
      order.status = status
      order.save!
      Rails.logger.info "Set status of order ##{order.id} to Complete"
    end

    def create_delivery(order, delivery_on)
      delivery = Delivery.create!(bouquet: order.bouquet.name,
        recipient_name: order.recipient_name,
        delivery_on: delivery_on,
        order: order,
        shipping_method: order.shipping_method
      )
      Rails.logger.info "Created delivery for order ##{order.id} and delivery date #{delivery_on}"
      delivery
    end
  end
end
