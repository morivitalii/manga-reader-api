class RemoveCtetReferencesFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pages, :cleaner, foreign_key: true
    remove_reference :pages, :translator, foreign_key: true
    remove_reference :pages, :editor, foreign_key: true
    remove_reference :pages, :typer, foreign_key: true
  end
end
