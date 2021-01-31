class AddForeignKeyFromResourceMarksToMarks < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_marks, :marks, column: :mark_id
  end
end
