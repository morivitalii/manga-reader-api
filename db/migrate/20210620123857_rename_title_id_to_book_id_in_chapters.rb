class RenameTitleIdToBookIdInChapters < ActiveRecord::Migration[6.1]
  def change
    rename_column :chapters, :title_id, :book_id
  end
end
