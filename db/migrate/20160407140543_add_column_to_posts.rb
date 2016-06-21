class AddColumnToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :title, :text
      add_column :posts, :count, :string
  end
end
