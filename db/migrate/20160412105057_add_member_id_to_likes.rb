class AddMemberIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :member_id, :integer
  end
end
