class CreateResourceTranslators < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_translators do |t|
      t.belongs_to :translator, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:translator_id, :resource_type, :resource_id], unique: true, name: "index_resource_translators_uniqueness"
    end
  end
end
