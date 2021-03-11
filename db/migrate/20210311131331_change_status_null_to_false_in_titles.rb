class ChangeStatusNullToFalseInTitles < ActiveRecord::Migration[6.1]
  def change
    change_column_null :titles, :status, false
  end
end
