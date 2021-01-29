class DropResourceTags < ActiveRecord::Migration[6.1]
  def change
    drop_table :resource_tags do |t|
      t.belongs_to :tag, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:tag_id, :resource_type, :resource_id], unique: true, name: "index_resource_tags_uniqueness"
    end
  end
end
