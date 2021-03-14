class AddContentLanguageReferenceToChapter < ActiveRecord::Migration[6.1]
  def change
    add_reference :chapters, :content_language, foreign_key: true, index: true, null: false
  end
end
