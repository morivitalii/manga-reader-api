class CreateContentLanguageTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :content_language_translations do |t|
      # Only in this table option null: false is skipped. Because model refers to itself on creation
      t.belongs_to :content_language, foreign_key: true
      t.belongs_to :resource, null: false, foreign_key: { to_table: :content_languages }
      t.string :title, null: false, default: ""
      t.datetime :edited_at, null: false, precision: 6
      t.timestamps

      t.index [:resource_id, :content_language_id], unique: true, name: "index_content_language_translations_uniqueness"
    end
  end
end
