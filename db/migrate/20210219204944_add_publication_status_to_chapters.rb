class AddPublicationStatusToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :publication_status, :integer, index: true
  end
end
