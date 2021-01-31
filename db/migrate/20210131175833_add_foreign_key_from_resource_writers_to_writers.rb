class AddForeignKeyFromResourceWritersToWriters < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_writers, :writers, column: :writer_id
  end
end
