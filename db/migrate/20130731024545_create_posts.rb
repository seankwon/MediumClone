class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :header
      t.text :content
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
