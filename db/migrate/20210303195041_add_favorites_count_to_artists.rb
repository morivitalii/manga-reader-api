class AddFavoritesCountToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :favorites_count, :bigint, null: false, default: 0
  end
end
