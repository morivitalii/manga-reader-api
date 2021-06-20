class RenameTitlesToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_table :titles, :books
  end
end
