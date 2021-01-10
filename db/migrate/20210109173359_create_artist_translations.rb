class CreateArtistTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_translations do |t|
      t.belongs_to :content_language, foreign_key: true, null: false
      t.belongs_to :resource, null: false, foreign_key: {to_table: :artists}
      t.string :name, null: false, default: ""
      t.datetime :edited_at, null: false, precision: 6
      t.timestamps

      t.index [:resource_id, :content_language_id], unique: true, name: "index_artist_translations_uniqueness"
      t.index :name
    end
  end
end
