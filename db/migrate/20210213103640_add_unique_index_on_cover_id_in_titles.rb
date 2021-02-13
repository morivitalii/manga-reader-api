class AddUniqueIndexOnCoverIdInTitles < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :titles, :cover_id, unique: true, algorithm: :concurrently
  end
end
