class CreateResourceMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_marks do |t|
      t.belongs_to :mark, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:mark_id, :resource_type, :resource_id], unique: true, name: "index_resource_marks_uniqueness"
    end
  end
end
