class AddPublicationStatusToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :publication_status, :integer, index: true
  end
end
