class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :category
      t.date :post_date
      t.text :emotion
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
