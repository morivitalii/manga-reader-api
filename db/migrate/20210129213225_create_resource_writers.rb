class CreateResourceWriters < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_writers do |t|
      t.belongs_to :writer, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:writer_id, :resource_type, :resource_id], unique: true, name: "index_resource_writers_uniqueness"
    end
  end
end
