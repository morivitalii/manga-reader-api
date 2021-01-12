class AddUniqueIndexOnArtistIdArtistTypeResourceTypeAndResourceIdInResourceArtists < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :resource_artists,
      [:artist_id, :artist_type, :resource_type, :resource_id],
      unique: true,
      name: :index_resource_artists_uniqueness,
      algorithm: :concurrently
  end
end
