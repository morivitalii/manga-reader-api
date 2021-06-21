class RenameNameToTitleInChapters < ActiveRecord::Migration[6.1]
  def change
    rename_column :chapters, :name, :title
  end
end
