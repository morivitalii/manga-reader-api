class AddStatusToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :status, :integer, index: true
  end
end
