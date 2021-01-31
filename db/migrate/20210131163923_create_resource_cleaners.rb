class CreateResourceCleaners < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_cleaners do |t|
      t.belongs_to :cleaner, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:cleaner_id, :resource_type, :resource_id], unique: true, name: "index_resource_cleaners_uniqueness"
    end
  end
end
