class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.text :content
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end
