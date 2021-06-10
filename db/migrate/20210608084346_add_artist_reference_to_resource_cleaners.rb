class AddArtistReferenceToResourceCleaners < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_cleaners, :artist, foreign_key: true, null: false
    add_index :resource_cleaners, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_cleaners_uniqueness
  end
end
