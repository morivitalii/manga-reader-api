class RemoveTranslatorReferenceFromResourceTranslators < ActiveRecord::Migration[6.1]
  def change
    remove_index :resource_translators, column: [:translator_id, :resource_type, :resource_id], unique: true, name: :index_resource_translators_uniqueness
    remove_reference :resource_translators, :translator, foreign_key: true, null: false
  end
end
