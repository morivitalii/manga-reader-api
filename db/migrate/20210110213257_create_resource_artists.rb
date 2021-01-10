class CreateResourceArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_artists do |t|
      t.belongs_to :artist, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps
    end
  end
end
