class AddArtistReferenceToResourceEditors < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_editors, :artist, foreign_key: true, null: false
    add_index :resource_editors, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_editors_uniqueness
  end
end
