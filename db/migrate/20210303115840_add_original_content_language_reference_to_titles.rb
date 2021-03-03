class AddOriginalContentLanguageReferenceToTitles < ActiveRecord::Migration[6.1]
  def change
    add_reference :titles, :original_content_language, foreign_key: { to_table: :content_languages }, null: true, index: true
  end
end
