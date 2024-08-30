class AddQestion5ToMinds < ActiveRecord::Migration[6.1]
  def change
    add_column :minds, :question5, :string
  end
end
