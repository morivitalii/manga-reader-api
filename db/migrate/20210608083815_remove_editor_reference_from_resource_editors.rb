class RemoveEditorReferenceFromResourceEditors < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_editors, column: [:editor_id, :resource_type, :resource_id], unique: true, name: :index_resource_editors_uniqueness
    remove_reference :resource_editors, :editor, foreign_key: true, null: false
  end
end
