class AddIndexOnNumberInChapters < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :chapters, :number, algorithm: :concurrently
  end
end
