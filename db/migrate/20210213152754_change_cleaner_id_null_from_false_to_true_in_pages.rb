class ChangeCleanerIdNullFromFalseToTrueInPages < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pages, :cleaner_id, true
  end
end
