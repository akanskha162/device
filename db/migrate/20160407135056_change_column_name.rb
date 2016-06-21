class ChangeColumnName < ActiveRecord::Migration
  def change
    def up
      change_column :posts, :content, :text
    end

    def down
      change_column :posts, :content, :string
    end
  end
end
