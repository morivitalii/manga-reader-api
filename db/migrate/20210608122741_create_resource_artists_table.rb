class CreateResourceArtistsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_artists do |t|
      t.belongs_to :artist, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.integer :artist_type, null: false
      t.timestamps

      t.index :artist_type
      t.index [:artist_type, :artist_id, :resource_type, :resource_id], unique: true, name: :index_resource_artists_uniqueness
    end
  end
end
