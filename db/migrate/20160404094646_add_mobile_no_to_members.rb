class AddMobileNoToMembers < ActiveRecord::Migration
  def change
     add_column :members, :mobile_no, :bigint
  end
end
