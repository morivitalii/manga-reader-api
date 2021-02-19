class ChangePublicationStatusNullToFalseInTitles < ActiveRecord::Migration[6.1]
  def change
    change_column_null :titles, :publication_status, false
  end
end
