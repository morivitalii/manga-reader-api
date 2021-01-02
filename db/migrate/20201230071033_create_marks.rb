class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.belongs_to :tag, null: false, foreign_key: true, index: {unique: true}
      t.timestamps
    end
  end
end
