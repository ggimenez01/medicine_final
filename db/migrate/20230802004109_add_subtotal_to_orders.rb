class AddSubtotalToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :subtotal, :decimal
  end
end
