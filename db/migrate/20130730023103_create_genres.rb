class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.text :genre_name

      t.timestamps
    end
  end
end
