class AddUserReferenceToChapters < ActiveRecord::Migration[6.1]
  def change
    add_reference :chapters, :user, foreign_key: true, index: true, null: false
  end
end
