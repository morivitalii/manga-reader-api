class CreateTitleTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :title_translations do |t|
      t.belongs_to :content_language, foreign_key: true, null: false
      t.belongs_to :resource, null: false, foreign_key: { to_table: :titles }
      t.string :title, null: false, default: ""
      t.datetime :edited_at, null: false, precision: 6
      t.timestamps

      t.index [:resource_id, :content_language_id], unique: true, name: "index_title_translations_uniqueness"
    end
  end
end
