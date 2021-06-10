class AddArtistReferenceToResourcePainters < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_painters, :artist, foreign_key: true, null: false
    add_index :resource_painters, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_painters_uniqueness
  end
end
