class AddUserIdToReds < ActiveRecord::Migration
  def change
    add_column :reds, :user_id, :integer
  end
end
