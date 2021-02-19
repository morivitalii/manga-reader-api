class ChangePublicationStatusNullToFalseInChapters < ActiveRecord::Migration[6.1]
  def change
    change_column_null :chapters, :publication_status, false
  end
end
