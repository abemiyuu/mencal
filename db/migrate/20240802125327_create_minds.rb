class CreateMinds < ActiveRecord::Migration[6.1]
  def change
    create_table :minds do |t|
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4

      t.timestamps
    end
  end
end
