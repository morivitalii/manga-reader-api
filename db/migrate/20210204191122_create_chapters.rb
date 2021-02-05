class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :title, foreign_key: true, null: false
      t.belongs_to :volume, foreign_key: true, null: true
      t.belongs_to :group, foreign_key: true, null: false
      t.integer :number, null: false
      t.timestamps

      t.index [:title_id, :group_id, :number], unique: true
    end
  end
end
