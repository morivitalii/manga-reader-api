class AddIndexOnStatusInTitles < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :titles, :status, algorithm: :concurrently
  end
end
