class AddLastNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :last_name, :string
    add_column :profiles, :first_name, :string
    add_column :profiles, :address, :text
    add_column :profiles, :city, :string
  end
end
