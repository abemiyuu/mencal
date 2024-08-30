class CreatePerfumes < ActiveRecord::Migration[6.1]
  def change
    create_table :perfumes do |t|
      t.string :question5

      t.timestamps
    end
  end
end
