class RemovePainterReferenceFromResourcePainters < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_painters, column: [:painter_id, :resource_type, :resource_id], unique: true, name: :index_resource_painters_uniqueness
    remove_reference :resource_painters, :painter, foreign_key: true, null: false
  end
end
