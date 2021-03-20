class RemoveCoverReferenceFromTitles < ActiveRecord::Migration[6.1]
  def change
    remove_index :titles, :cover_id, unique: true
    remove_reference :titles, :cover, foreign_key: true, index: false
  end
end
