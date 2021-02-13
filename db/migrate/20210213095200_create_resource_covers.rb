class CreateResourceCovers < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_covers do |t|
      t.belongs_to :cover, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:cover_id, :resource_type, :resource_id], unique: true, name: "index_resource_covers_uniqueness"
    end
  end
end
