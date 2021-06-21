class ReplaceVolumeReferenceWithColumnInChapters < ActiveRecord::Migration[6.1]
  def change
    remove_reference :chapters, :volume, null: true, foreign_key: true
    add_column :chapters, :volume, :integer, null: true
  end
end
