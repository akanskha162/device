class AddTotalAmountCentsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :total_amount_cents, :integer
  end
end
