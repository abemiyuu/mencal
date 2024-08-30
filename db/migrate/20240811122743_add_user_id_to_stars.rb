class AddUserIdToStars < ActiveRecord::Migration[6.1]
  def change
    add_column :stars, :user_id, :integer
  end
end
