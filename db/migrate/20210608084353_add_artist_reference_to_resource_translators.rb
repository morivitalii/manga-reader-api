class AddArtistReferenceToResourceTranslators < ActiveRecord::Migration[6.1]
  def change
    add_reference :resource_translators, :artist, foreign_key: true, null: false
    add_index :resource_translators, [:artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_translators_uniqueness
  end
end
