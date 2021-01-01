class AddIndexOnTitleInTitleTranslations < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :title_translations, :title, algorithm: :concurrently
  end
end
