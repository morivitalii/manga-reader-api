class CreateResourceFormats < ActiveRecord::Migration[6.1]
  create_table :resource_formats do |t|
    t.belongs_to :format, null: false
    t.belongs_to :resource, polymorphic: true, null: false
    t.timestamps

    t.index [:format_id, :resource_type, :resource_id], unique: true, name: "index_resource_formats_uniqueness"
  end
end
