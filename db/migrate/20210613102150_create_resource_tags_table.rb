class CreateResourceTagsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_tags do |t|
      t.belongs_to :tag, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.integer :tag_type, null: false
      t.timestamps

      t.index :tag_type
      t.index [:tag_type, :tag_id, :resource_type, :resource_id], unique: true, name: :index_resource_tags_uniqueness
    end
  end
end
