class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.integer :total
      t.string :order_date
      t.string :status

      t.timestamps
    end
  end
end
