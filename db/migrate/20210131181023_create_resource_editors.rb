class CreateResourceEditors < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_editors do |t|
      t.belongs_to :editor, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:editor_id, :resource_type, :resource_id], unique: true, name: "index_resource_editors_uniqueness"
    end
  end
end
