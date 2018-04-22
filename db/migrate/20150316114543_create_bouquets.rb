class CreateBouquets < ActiveRecord::Migration[5.1]
  def change
    create_table :bouquets do |t|
      t.string :name, required: true
      t.float :price, required: true

      t.timestamps null: false
    end
  end
end
