class CreateVolumes < ActiveRecord::Migration[6.1]
  def change
    create_table :volumes do |t|
      t.belongs_to :title, null: false, foreign_key: true
      t.integer :number, null: false
      t.timestamps

      t.index [:title_id, :number], unique: true
    end
  end
end
