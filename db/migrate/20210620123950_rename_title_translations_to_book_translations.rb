class RenameTitleTranslationsToBookTranslations < ActiveRecord::Migration[6.1]
  def change
    rename_table :title_translations, :book_translations
  end
end
