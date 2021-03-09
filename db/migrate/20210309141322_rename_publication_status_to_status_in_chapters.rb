class RenamePublicationStatusToStatusInChapters < ActiveRecord::Migration[6.1]
  def change
    rename_column :chapters, :publication_status, :status
  end
end
