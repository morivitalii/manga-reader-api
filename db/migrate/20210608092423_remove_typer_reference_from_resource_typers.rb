class RemoveTyperReferenceFromResourceTypers < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_typers, column: [:typer_id, :resource_type, :resource_id], unique: true, name: :index_resource_typers_uniqueness
    remove_reference :resource_typers, :typer, foreign_key: true, null: false
  end
end
