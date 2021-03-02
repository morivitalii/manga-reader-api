class SetTitleNullToTrueInContentLanguageTranslations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :content_language_translations, :title, true
  end
end
