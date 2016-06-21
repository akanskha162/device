class AddColumnToMembers < ActiveRecord::Migration
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
    add_column :members, :oauth_token, :string
    add_column :members, :oauth_expires_at, :string
  end
end
