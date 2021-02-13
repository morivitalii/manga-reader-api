class ChangeTranslatorIdNullFromFalseToTrueInPages < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pages, :translator_id, true
  end
end
