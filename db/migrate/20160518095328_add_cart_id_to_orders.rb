class AddCartIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cart_id, :string
  end
end
