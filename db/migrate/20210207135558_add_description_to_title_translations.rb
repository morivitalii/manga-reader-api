class AddDescriptionToTitleTranslations < ActiveRecord::Migration[6.1]
  def change
    add_column :title_translations, :description, :text, null: false, default: ""
  end
end
