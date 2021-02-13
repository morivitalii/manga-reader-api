class ChangeEditorIdNullFromFalseToTrueInPages < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pages, :editor_id, true
  end
end
