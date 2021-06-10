class RemoveCleanerReferenceFromResourceCleaners < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_cleaners, column: [:cleaner_id, :resource_type, :resource_id], unique: true, name: :index_resource_cleaners_uniqueness
    remove_reference :resource_cleaners, :cleaner, foreign_key: true, null: false
  end
end
