class AddArtistTypeToResourceArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :resource_artists, :artist_type, :string, null: false
  end
end
