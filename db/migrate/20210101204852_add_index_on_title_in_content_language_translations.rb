class AddIndexOnTitleInContentLanguageTranslations < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :content_language_translations, :title, algorithm: :concurrently
  end
end
