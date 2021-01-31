class AddForeignKeyFromResourceGenresToGenres < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_genres, :genres, column: :genre_id
  end
end
