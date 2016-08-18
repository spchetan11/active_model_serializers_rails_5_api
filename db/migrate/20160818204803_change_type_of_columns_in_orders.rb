class ChangeTypeOfColumnsInOrders < ActiveRecord::Migration[5.0]
  def change
  	change_column :orders, :order_number, :integer
  	change_column :orders, :quantity, :integer
  end
end
