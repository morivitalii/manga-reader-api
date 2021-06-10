class AddArtistReferenceToResourceWriters < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_writers, :artist, foreign_key: true, null: false
    add_index :resource_writers, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_writers_uniqueness
  end
end
