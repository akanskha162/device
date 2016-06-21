class CreateProductdrawers < ActiveRecord::Migration
  def change
    create_table :productdrawers do |t|

      t.timestamps null: false
    end
  end
end
