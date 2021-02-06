class AddIndexOnKeyInLocales < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :locales, :key, algorithm: :concurrently
  end
end
