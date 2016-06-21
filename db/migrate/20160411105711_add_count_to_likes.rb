class AddCountToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :count, :integer
  end
end
