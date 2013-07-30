class AddGenreIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :genre_id, :integer
  end
end
