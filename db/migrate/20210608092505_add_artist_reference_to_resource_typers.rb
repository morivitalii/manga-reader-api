class AddArtistReferenceToResourceTypers < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_typers, :artist, foreign_key: true, null: false
    add_index :resource_typers, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_typers_uniqueness
  end
end
