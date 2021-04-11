class AddIndexOnStatusInChapters < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :chapters, :status, algorithm: :concurrently
  end
end
