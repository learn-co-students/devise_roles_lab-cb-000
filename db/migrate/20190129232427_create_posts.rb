class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |t|
      t.string :content , null: false
      t.integer :user_id , null: false

      t.timestamps null: false
    end
  end
end
