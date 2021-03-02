class SetTitleNullToTrueInInterfaceLanguageTranslations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :interface_language_translations, :title, true
  end
end
