class AddCoverReferenceToTitles < ActiveRecord::Migration[6.1]
  def change
    add_reference :titles, :cover, foreign_key: true, index: false, null: true
  end
end
