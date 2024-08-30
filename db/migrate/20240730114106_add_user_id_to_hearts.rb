class AddUserIdToHearts < ActiveRecord::Migration[6.1]
  def change
    add_column :hearts, :user_id, :integer
  end
end
