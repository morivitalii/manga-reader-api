class CreateResourceGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_genres do |t|
      t.belongs_to :genre, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:genre_id, :resource_type, :resource_id], unique: true, name: "index_resource_genres_uniqueness"
    end
  end
end
