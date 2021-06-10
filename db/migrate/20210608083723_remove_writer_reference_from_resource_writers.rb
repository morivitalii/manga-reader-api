class RemoveWriterReferenceFromResourceWriters < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_writers, column: [:writer_id, :resource_type, :resource_id], unique: true, name: :index_resource_writers_uniqueness
    remove_reference :resource_writers, :writer, foreign_key: true, null: false
  end
end
