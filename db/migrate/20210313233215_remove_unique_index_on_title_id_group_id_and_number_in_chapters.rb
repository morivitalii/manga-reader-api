class RemoveUniqueIndexOnTitleIdGroupIdAndNumberInChapters < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    remove_index :chapters, column: [:title_id, :group_id, :number], unique: true
  end
end
