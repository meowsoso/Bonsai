class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.date :start_date
      t.text :difficulty
      t.integer :user_id

      t.timestamps
    end
  end
end
