class ChangeColumnTypeInPosts < ActiveRecord::Migration
  def up
    change_column :posts, :count, :text
  end

  def down
    change_column :posts, :count, :string
  end
end