class AddNameToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :name, :string, null: false, default: ""
  end
end
