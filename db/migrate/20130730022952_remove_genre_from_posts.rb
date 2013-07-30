class RemoveGenreFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :genre, :string
  end
end
