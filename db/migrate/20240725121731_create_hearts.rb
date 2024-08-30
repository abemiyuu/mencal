class CreateHearts < ActiveRecord::Migration[6.1]
  def change
    create_table :hearts do |t|
      t.string :image
      t.string :body
      t.string :genre

      t.timestamps
    end
  end
end
