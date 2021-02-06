class AddIndexOnTitleInGroups < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :groups, :title, algorithm: :concurrently
  end
end
