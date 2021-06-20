class RenameTitleIdToBookIdInVolumes < ActiveRecord::Migration[6.1]
  def change
    rename_column :volumes, :title_id, :book_id
  end
end
