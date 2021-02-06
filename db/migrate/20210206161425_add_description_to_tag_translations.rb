class AddDescriptionToTagTranslations < ActiveRecord::Migration[6.1]
  def change
    add_column :tag_translations, :description, :text, null: false, default: ""
  end
end
