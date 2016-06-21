class AddColumn1ToMembers < ActiveRecord::Migration
  def change
    add_column :members, :facebook_uid, :string
    add_column :members, :facebook_oauth_token, :string
  end
end
