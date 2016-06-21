class AddDateToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :date, :datetime
  end
end
