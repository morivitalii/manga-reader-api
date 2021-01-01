class AddIndexOnTitleInInterfaceLanguageTranslations < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :interface_language_translations, :title, algorithm: :concurrently
  end
end
