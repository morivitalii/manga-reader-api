class AddCoverReferenceToChapters < ActiveRecord::Migration[6.1]
  def change
    add_reference :chapters, :cover, null: true, foreign_key: { to_table: :pages }
  end
end
