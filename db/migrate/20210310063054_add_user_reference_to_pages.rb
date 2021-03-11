class AddUserReferenceToPages < ActiveRecord::Migration[6.1]
  def change
    add_reference :pages, :user, foreign_key: true, index: true, null: false
  end
end
