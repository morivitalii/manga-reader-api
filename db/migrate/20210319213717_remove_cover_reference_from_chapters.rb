class RemoveCoverReferenceFromChapters < ActiveRecord::Migration[6.1]
  def change
    remove_reference :chapters, :cover, index: true, foreign_key: { to_table: :pages }
  end
end
