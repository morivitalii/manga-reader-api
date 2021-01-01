class AddIndexOnTitleInTagTranslations < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :tag_translations, :title, algorithm: :concurrently
  end
end
