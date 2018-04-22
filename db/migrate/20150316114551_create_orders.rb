class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :recipient_name, required: true
      t.references :bouquet, required: true
      t.date :delivery_on, required: true
      t.string :status, default: 'pending', required: true
      t.float :cost, required: true

      t.timestamps null: false
    end
  end
end
