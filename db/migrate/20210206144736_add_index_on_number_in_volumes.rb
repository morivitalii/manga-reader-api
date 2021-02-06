class AddIndexOnNumberInVolumes < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :volumes, :number, algorithm: :concurrently
  end
end
