class ChangeTyperIdNullFromFalseToTrueInPages < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pages, :typer_id, true
  end
end
