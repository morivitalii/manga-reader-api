class CreateInterfaceLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :interface_languages do |t|
      t.belongs_to :locale, null: false, foreign_key: true, index: {unique: true}
      t.timestamps
    end
  end
end
