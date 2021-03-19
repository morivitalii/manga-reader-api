class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.belongs_to :interface_language, foreign_key: true, index: true
      t.string :name, null: false, default: ""
      t.string :surname, null: false, default: ""
      t.integer :sex, null: false
      t.timestamps
    end
  end
end
