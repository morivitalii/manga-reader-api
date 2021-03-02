class AddUpdatedAtToViews < ActiveRecord::Migration[6.1]
  def change
    add_column :views, :updated_at, :datetime, precision: 6, null: false
    add_index :views, :updated_at
  end
end
