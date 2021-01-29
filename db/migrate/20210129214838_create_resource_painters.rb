class CreateResourcePainters < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_painters do |t|
      t.belongs_to :painter, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:painter_id, :resource_type, :resource_id], unique: true, name: "index_resource_painters_uniqueness"
    end
  end
end
